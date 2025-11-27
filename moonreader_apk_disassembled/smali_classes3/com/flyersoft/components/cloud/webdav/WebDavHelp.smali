.class public Lcom/flyersoft/components/cloud/webdav/WebDavHelp;
.super Ljava/lang/Object;
.source "WebDavHelp.java"


# static fields
.field public static ok:Ljava/lang/Boolean;

.field public static pass:Ljava/lang/String;

.field public static user:Ljava/lang/String;

.field public static webDavUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getWebDavUrl()Ljava/lang/String;
    .locals 1

    .line 15
    sget-object v0, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->webDavUrl:Ljava/lang/String;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->ok:Ljava/lang/Boolean;

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    .line 16
    invoke-static {v0}, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->initWebDav(Z)Z

    .line 20
    :cond_1
    sget-object v0, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->webDavUrl:Ljava/lang/String;

    return-object v0
.end method

.method public static getWebDavUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 24
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "http"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p0

    .line 26
    :cond_0
    invoke-static {}, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->getWebDavUrl()Ljava/lang/String;

    move-result-object v0

    .line 27
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 28
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 29
    :cond_1
    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 30
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 32
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static initWebDav(Z)Z
    .locals 2

    .line 37
    sget-object v0, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->ok:Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    if-nez p0, :cond_0

    .line 38
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    .line 40
    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->getContext()Landroid/content/Context;

    move-result-object p0

    const-string v0, "webdav"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 41
    const-string v0, "ok"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->ok:Ljava/lang/Boolean;

    .line 42
    const-string v0, "url"

    const-string v1, "https://"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->webDavUrl:Ljava/lang/String;

    .line 43
    const-string v0, "user"

    const-string v1, ""

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->user:Ljava/lang/String;

    .line 44
    const-string v0, "pass"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/flyersoft/tools/T;->mySimpleDecript(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->pass:Ljava/lang/String;

    .line 49
    sget-object p0, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->user:Ljava/lang/String;

    invoke-static {p0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_1

    sget-object p0, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->pass:Ljava/lang/String;

    invoke-static {p0}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_1

    .line 50
    sget-object p0, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->user:Ljava/lang/String;

    sget-object v0, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->pass:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/flyersoft/components/cloud/webdav/http/WAuth;->setAuth(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    :cond_1
    invoke-static {}, Lcom/flyersoft/components/cloud/webdav/http/WHttp;->getInstance()Lcom/flyersoft/components/cloud/webdav/http/WHttp;

    move-result-object p0

    invoke-virtual {p0}, Lcom/flyersoft/components/cloud/webdav/http/WHttp;->reset()V

    .line 52
    sget-object p0, Lcom/flyersoft/components/cloud/webdav/WebDavHelp;->ok:Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method
