// traefik-config.ts

export interface TraefikConfig {
    http: HttpConfig;
}

export interface HttpConfig {
    middlewares?: Record<string, Middleware>;
    serversTransports?: Record<string, ServersTransport>;
    services?: Record<string, Service>;
    routers?: Record<string, Router>;
}

export interface Middleware {
    ipAllowList?: {
        sourceRange: string[];
    };
    forwardAuth?: {
        address: string;
        trustForwardHeader?: boolean;
    };
}

export interface ServersTransport {
    insecureSkipVerify?: boolean;
}

export interface Service {
    loadBalancer: {
        servers: Server[];
        serversTransport?: string;
    };
}

export interface Server {
    url: string;
}

export interface Router {
    rule: string;
    service: string;
    entryPoints: string[];
    middlewares?: string[];
    tls?: {
        certResolver?: string;
    };
}
