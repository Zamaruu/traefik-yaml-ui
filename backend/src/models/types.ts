// Allgemeine Typen

export type Nullable<T> = T | null | undefined;

export interface HTTPDynamicConfig {
    http?: {
        routers?: Record<string, RouterHTTP>;
        services?: Record<string, HTTPService>;
        middlewares?: Record<string, HTTPMiddleware>;
    };
    tcp?: {
        routers?: Record<string, RouterTCP>;
        services?: Record<string, TCPService>;
        middlewares?: Record<string, TCPMiddleware>;
    };
}

// HTTP Routers

export interface RouterHTTP {
    entryPoints?: string[];
    rule: string;
    service: string;
    middlewares?: string[];
    priority?: number;
    tls?: RouterTLSConfig;
    ruleSyntax?: "v2" | "v3";
    // Observability (optional features)
    observability?: {
        accessLogs?: boolean;
        metrics?: boolean;
        tracing?: boolean;
    };
}

export interface RouterTLSConfig {
    // Wenn nur `{}` angegeben, ist TLS aktiviert, alle Defaultwerte
    certResolver?: string;
    domains?: Array<{ main: string; sans?: string[] }>;
    options?: string;
    passthrough?: boolean;
    // andere TLS-bezogene Felder je nach Version
}

// TCP Routers

export interface RouterTCP {
    entryPoints?: string[];
    rule: string;  // z. B. HostSNI(`*`)
    service: string;
    middlewares?: string[];
    priority?: number;
    tls?: RouterTLSConfig;  // ähnlich wie bei HTTP, evtl. reduziert
}

// Services

export interface HTTPService {
    loadBalancer: LoadBalancer;
    // evtl. RoundRobin, Weighted, etc. je nach Erweiterung
}

export interface LoadBalancer {
    servers: Server[];
    passHostHeader?: boolean;
    sticky?: Sticky;  // wenn Sitzungsbindung benötigt
    // evtl. healthChecks etc.
}

export interface Server {
    url: string;
    weight?: number;
    // evtl. optionales Maximum / Timeout etc.
}

export interface Sticky {
    cookie?: {
        name?: string;
        secure?: boolean;
        httpOnly?: boolean;
        sameSite?: "Lax" | "Strict" | "None";
    };
    // andere sticky-Strategien falls unterstützt
}

// TCP Services

export interface TCPService {
    loadBalancer: TCPLoadBalancer;
}

export interface TCPLoadBalancer {
    servers: ServerTCP[];
}

export interface ServerTCP {
    address: string;  // z. B. "ip:port"
    weight?: number;
}

// Middlewares (HTTP)

export interface HTTPMiddleware {
    // Nur eins der Felder wird typischerweise benutzt, je nachdem welcher Typ von Middleware
    addPrefix?: { prefix: string };
    addSuffix?: { suffix: string };  // wenn unterstützt
    stripPrefix?: { prefixes: string[] };
    stripPrefixRegex?: { regex: string };
    replacePath?: { path: string };
    replacePathRegex?: { regex: string; replacement: string };
    redirectScheme?: { scheme: string; permanent?: boolean; port?: string };
    redirectRegex?: { regex: string; replacement: string; permanent?: boolean };
    headers?: HeadersMiddleware;
    basicAuth?: BasicAuthMiddleware;
    digestAuth?: DigestAuthMiddleware;
    ipWhiteList?: IPWhiteListMiddleware;
    forwardAuth?: ForwardAuthMiddleware;
    compress?: CompressMiddleware;
    buffer?: BufferingMiddleware;
    rateLimit?: RateLimitMiddleware;
    circuitBreaker?: CircuitBreakerMiddleware;
    retry?: RetryMiddleware;
    errors?: ErrorsMiddleware;
    chain?: ChainMiddleware;
    // evtl. weitere Typen je nach Traefik-Version
}

export interface HeadersMiddleware {
    customRequestHeaders?: Record<string, string>;
    customResponseHeaders?: Record<string, string>;
    // Sicherheit / HSTS etc.
    frameDeny?: boolean;
    contentTypeNosniff?: boolean;
    browserXSSFilter?: boolean;
    sslRedirect?: boolean;
    stsSeconds?: number;
    stsIncludeSubdomains?: boolean;
    stsPreload?: boolean;
    forceSTSHeader?: boolean;
    stsHeader?: boolean;  // je nach Version
    hostsProxyHeaders?: string[];
    // etc.
}

export interface BasicAuthMiddleware {
    users?: string[];   // z. B. ["user:hash", ...]
    usersFile?: string;
    realm?: string;
}

export interface DigestAuthMiddleware {
    users?: string[];
    realm?: string;
}

export interface IPWhiteListMiddleware {
    sourceRange: string[];
    ipStrategy?: {
        depth?: number;
        excludedIPs?: string[];
    };
}

export interface ForwardAuthMiddleware {
    address: string;
    trustForwardHeader?: boolean;
    authResponseHeaders?: string[];  // optional
}

export interface CompressMiddleware {
    // z. B. minContentLength, excludeContentTypes etc.
    minResponseBodyBytes?: number;
    excludedContentTypes?: string[];
}

export interface BufferingMiddleware {
    maxRequestBodyBytes?: string;
    maxResponseBodyBytes?: string;
    memRequestBodyBytes?: string;
    memResponseBodyBytes?: string;
}

export interface RateLimitMiddleware {
    average: number;
    burst: number;
    sourceCriterion?: {
        ipStrategy?: { depth?: number; excludedIPs?: string[] };
    };
}

export interface CircuitBreakerMiddleware {
    expression?: string;
    // andere Parameter wie "retry-after-header" etc.
}

export interface RetryMiddleware {
    attempts?: number;
    initialInterval?: string;
    maxInterval?: string;
}

export interface ErrorsMiddleware {
    status?: {
        codes?: number[];
        // z. B. ["400-499", "500-599"] etc.
    };
    service?: string;
    query?: string;  // z. B. ein Pfad zur Fehlerseite etc.
}

export interface ChainMiddleware {
    middlewares: string[];
}

// Middlewares (TCP) – falls unterstützt

export interface TCPMiddleware {
    // z. B. optional TLS passthrough, etc. Oder IPWhitelist, je nachdem, was TCP-Middlewares bieten
    ipWhiteList?: IPWhiteListMiddleware;
    // ggf. andere TCP-spezifische
}
