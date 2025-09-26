export interface TraefikConfig {
    http: HttpConfig;
}

export interface HttpConfig {
    middlewares?: Middleware[];
    serversTransports?: ServersTransport[];
    services?: Service[];
    routers?: TraefikRouter[];
}

// Middleware
export interface Middleware {
    name: string; // z. B. "ipallow"
    ipAllowList?: {
        sourceRange: string[];
    };
    forwardauth?: {
        address: string;
        trustForwardHeader?: boolean;
    };
}

// Transport
export interface ServersTransport {
    name: string; // z. B. "insecureTransport"
    insecureSkipVerify?: boolean;
}

// Service
export interface Service {
    name: string; // z. B. "plex"
    loadBalancer: {
        servers: Server[];
        serversTransport?: string;
    };
}

export interface Server {
    url: string;
}

// Router
export interface TraefikRouter {
    name: string; // z. B. "plex_router"
    rule: string;
    service: string;
    entryPoints: string[];
    middlewares?: string[];
    tls?: {
        certresolver?: string;
    };
}
