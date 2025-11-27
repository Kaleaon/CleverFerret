.class public Lcom/flyersoft/components/cloud/webdav/http/WHandler;
.super Ljava/net/URLStreamHandler;
.source "WHandler.java"


# static fields
.field public static final HANDLER:Ljava/net/URLStreamHandler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 9
    new-instance v0, Lcom/flyersoft/components/cloud/webdav/http/WHandler;

    invoke-direct {v0}, Lcom/flyersoft/components/cloud/webdav/http/WHandler;-><init>()V

    sput-object v0, Lcom/flyersoft/components/cloud/webdav/http/WHandler;->HANDLER:Ljava/net/URLStreamHandler;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/net/URLStreamHandler;-><init>()V

    return-void
.end method


# virtual methods
.method protected getDefaultPort()I
    .locals 1

    const/16 v0, 0x50

    return v0
.end method

.method public openConnection(Ljava/net/URL;)Ljava/net/URLConnection;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method protected parseURL(Ljava/net/URL;Ljava/lang/String;II)V
    .locals 0

    .line 21
    invoke-super {p0, p1, p2, p3, p4}, Ljava/net/URLStreamHandler;->parseURL(Ljava/net/URL;Ljava/lang/String;II)V

    return-void
.end method
