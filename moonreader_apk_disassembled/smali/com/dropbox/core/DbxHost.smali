.class public final Lcom/dropbox/core/DbxHost;
.super Ljava/lang/Object;
.source "DbxHost.java"


# static fields
.field public static final DEFAULT:Lcom/dropbox/core/DbxHost;

.field public static final Reader:Lcom/dropbox/core/json/JsonReader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/dropbox/core/json/JsonReader<",
            "Lcom/dropbox/core/DbxHost;",
            ">;"
        }
    .end annotation
.end field

.field public static final Writer:Lcom/dropbox/core/json/JsonWriter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/dropbox/core/json/JsonWriter<",
            "Lcom/dropbox/core/DbxHost;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final api:Ljava/lang/String;

.field private final content:Ljava/lang/String;

.field private final notify:Ljava/lang/String;

.field private final web:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 25
    new-instance v0, Lcom/dropbox/core/DbxHost;

    const-string v1, "www.dropbox.com"

    const-string v2, "notify.dropboxapi.com"

    const-string v3, "api.dropboxapi.com"

    const-string v4, "content.dropboxapi.com"

    invoke-direct {v0, v3, v4, v1, v2}, Lcom/dropbox/core/DbxHost;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/dropbox/core/DbxHost;->DEFAULT:Lcom/dropbox/core/DbxHost;

    .line 114
    new-instance v0, Lcom/dropbox/core/DbxHost$1;

    invoke-direct {v0}, Lcom/dropbox/core/DbxHost$1;-><init>()V

    sput-object v0, Lcom/dropbox/core/DbxHost;->Reader:Lcom/dropbox/core/json/JsonReader;

    .line 184
    new-instance v0, Lcom/dropbox/core/DbxHost$2;

    invoke-direct {v0}, Lcom/dropbox/core/DbxHost$2;-><init>()V

    sput-object v0, Lcom/dropbox/core/DbxHost;->Writer:Lcom/dropbox/core/json/JsonWriter;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/dropbox/core/DbxHost;->api:Ljava/lang/String;

    .line 45
    iput-object p2, p0, Lcom/dropbox/core/DbxHost;->content:Ljava/lang/String;

    .line 46
    iput-object p3, p0, Lcom/dropbox/core/DbxHost;->web:Ljava/lang/String;

    .line 47
    iput-object p4, p0, Lcom/dropbox/core/DbxHost;->notify:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)Lcom/dropbox/core/DbxHost;
    .locals 0

    .line 20
    invoke-static {p0}, Lcom/dropbox/core/DbxHost;->fromBaseHost(Ljava/lang/String;)Lcom/dropbox/core/DbxHost;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/DbxHost;)Ljava/lang/String;
    .locals 0

    .line 20
    invoke-direct {p0}, Lcom/dropbox/core/DbxHost;->inferBaseHost()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/DbxHost;)Ljava/lang/String;
    .locals 0

    .line 20
    iget-object p0, p0, Lcom/dropbox/core/DbxHost;->api:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$300(Lcom/dropbox/core/DbxHost;)Ljava/lang/String;
    .locals 0

    .line 20
    iget-object p0, p0, Lcom/dropbox/core/DbxHost;->content:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$400(Lcom/dropbox/core/DbxHost;)Ljava/lang/String;
    .locals 0

    .line 20
    iget-object p0, p0, Lcom/dropbox/core/DbxHost;->web:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$500(Lcom/dropbox/core/DbxHost;)Ljava/lang/String;
    .locals 0

    .line 20
    iget-object p0, p0, Lcom/dropbox/core/DbxHost;->notify:Ljava/lang/String;

    return-object p0
.end method

.method private static fromBaseHost(Ljava/lang/String;)Lcom/dropbox/core/DbxHost;
    .locals 6

    .line 111
    new-instance v0, Lcom/dropbox/core/DbxHost;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "api-"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "api-content-"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "meta-"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "api-notify-"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, v1, v2, v3, p0}, Lcom/dropbox/core/DbxHost;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method private inferBaseHost()Ljava/lang/String;
    .locals 5

    .line 172
    iget-object v0, p0, Lcom/dropbox/core/DbxHost;->web:Ljava/lang/String;

    const-string v1, "meta-"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/dropbox/core/DbxHost;->api:Ljava/lang/String;

    const-string v1, "api-"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/dropbox/core/DbxHost;->content:Ljava/lang/String;

    const-string v1, "api-content-"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/dropbox/core/DbxHost;->notify:Ljava/lang/String;

    const-string v1, "api-notify-"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 173
    iget-object v0, p0, Lcom/dropbox/core/DbxHost;->web:Ljava/lang/String;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 174
    iget-object v1, p0, Lcom/dropbox/core/DbxHost;->api:Ljava/lang/String;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 175
    iget-object v2, p0, Lcom/dropbox/core/DbxHost;->content:Ljava/lang/String;

    const/16 v3, 0xc

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 176
    iget-object v3, p0, Lcom/dropbox/core/DbxHost;->notify:Ljava/lang/String;

    const/16 v4, 0xb

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 177
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 99
    :cond_0
    instance-of v1, p1, Lcom/dropbox/core/DbxHost;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 100
    check-cast p1, Lcom/dropbox/core/DbxHost;

    .line 101
    iget-object v1, p1, Lcom/dropbox/core/DbxHost;->api:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/DbxHost;->api:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p1, Lcom/dropbox/core/DbxHost;->content:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/DbxHost;->content:Ljava/lang/String;

    .line 102
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p1, Lcom/dropbox/core/DbxHost;->web:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/DbxHost;->web:Ljava/lang/String;

    .line 103
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object p1, p1, Lcom/dropbox/core/DbxHost;->notify:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/DbxHost;->notify:Ljava/lang/String;

    .line 104
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    return v0

    :cond_1
    return v2
.end method

.method public getApi()Ljava/lang/String;
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/dropbox/core/DbxHost;->api:Ljava/lang/String;

    return-object v0
.end method

.method public getContent()Ljava/lang/String;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/dropbox/core/DbxHost;->content:Ljava/lang/String;

    return-object v0
.end method

.method public getNotify()Ljava/lang/String;
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/dropbox/core/DbxHost;->notify:Ljava/lang/String;

    return-object v0
.end method

.method public getWeb()Ljava/lang/String;
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/dropbox/core/DbxHost;->web:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 92
    iget-object v0, p0, Lcom/dropbox/core/DbxHost;->api:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/DbxHost;->content:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/DbxHost;->web:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/DbxHost;->notify:Ljava/lang/String;

    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method
