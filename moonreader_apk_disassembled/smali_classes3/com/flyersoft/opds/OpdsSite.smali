.class public Lcom/flyersoft/opds/OpdsSite;
.super Ljava/lang/Object;
.source "OpdsSite.java"


# instance fields
.field public baseUrl:Ljava/lang/String;

.field public cn_only:Z

.field public image:Ljava/lang/String;

.field public isHtml:Z

.field public lock_search_url:Z

.field public mainUrl:Ljava/lang/String;

.field public openSearchUrl:Ljava/lang/String;

.field public password:Ljava/lang/String;

.field public searchUrl:Ljava/lang/String;

.field public signInUrl:Ljava/lang/String;

.field public signOutUrl:Ljava/lang/String;

.field public site:Ljava/lang/String;

.field public summary:Ljava/lang/String;

.field public summary_cn:Ljava/lang/String;

.field public title:Ljava/lang/String;

.field public title_cn:Ljava/lang/String;

.field public topId:I

.field public useragent:Ljava/lang/String;

.field public username:Ljava/lang/String;

.field public xmlFile:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const-string v0, ""

    iput-object v0, p0, Lcom/flyersoft/opds/OpdsSite;->username:Ljava/lang/String;

    .line 16
    iput-object v0, p0, Lcom/flyersoft/opds/OpdsSite;->password:Ljava/lang/String;

    .line 17
    iput-object v0, p0, Lcom/flyersoft/opds/OpdsSite;->image:Ljava/lang/String;

    const/4 v0, -0x2

    .line 25
    iput v0, p0, Lcom/flyersoft/opds/OpdsSite;->topId:I

    return-void
.end method

.method constructor <init>(Z)V
    .locals 2

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const-string v0, ""

    iput-object v0, p0, Lcom/flyersoft/opds/OpdsSite;->username:Ljava/lang/String;

    .line 16
    iput-object v0, p0, Lcom/flyersoft/opds/OpdsSite;->password:Ljava/lang/String;

    .line 17
    iput-object v0, p0, Lcom/flyersoft/opds/OpdsSite;->image:Ljava/lang/String;

    const/4 v1, -0x2

    .line 25
    iput v1, p0, Lcom/flyersoft/opds/OpdsSite;->topId:I

    if-eqz p1, :cond_0

    .line 31
    iput-object v0, p0, Lcom/flyersoft/opds/OpdsSite;->baseUrl:Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/opds/OpdsSite;->xmlFile:Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/opds/OpdsSite;->signOutUrl:Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/opds/OpdsSite;->signInUrl:Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/opds/OpdsSite;->searchUrl:Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/opds/OpdsSite;->mainUrl:Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/opds/OpdsSite;->summary_cn:Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/opds/OpdsSite;->summary:Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/opds/OpdsSite;->title_cn:Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/opds/OpdsSite;->title:Ljava/lang/String;

    iput-object v0, p0, Lcom/flyersoft/opds/OpdsSite;->site:Ljava/lang/String;

    .line 33
    const-string p1, "OPDS/Stanza iPhone/Aldiko/Moon+ Reader(Android)"

    iput-object p1, p0, Lcom/flyersoft/opds/OpdsSite;->useragent:Ljava/lang/String;

    :cond_0
    return-void
.end method
