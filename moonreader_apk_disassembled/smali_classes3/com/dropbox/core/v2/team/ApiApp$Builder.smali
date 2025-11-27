.class public Lcom/dropbox/core/v2/team/ApiApp$Builder;
.super Ljava/lang/Object;
.source "ApiApp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/ApiApp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected final appId:Ljava/lang/String;

.field protected final appName:Ljava/lang/String;

.field protected final isAppFolder:Z

.field protected linked:Ljava/util/Date;

.field protected publisher:Ljava/lang/String;

.field protected publisherUrl:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 183
    iput-object p1, p0, Lcom/dropbox/core/v2/team/ApiApp$Builder;->appId:Ljava/lang/String;

    if-eqz p2, :cond_0

    .line 187
    iput-object p2, p0, Lcom/dropbox/core/v2/team/ApiApp$Builder;->appName:Ljava/lang/String;

    .line 188
    iput-boolean p3, p0, Lcom/dropbox/core/v2/team/ApiApp$Builder;->isAppFolder:Z

    const/4 p1, 0x0

    .line 189
    iput-object p1, p0, Lcom/dropbox/core/v2/team/ApiApp$Builder;->publisher:Ljava/lang/String;

    .line 190
    iput-object p1, p0, Lcom/dropbox/core/v2/team/ApiApp$Builder;->publisherUrl:Ljava/lang/String;

    .line 191
    iput-object p1, p0, Lcom/dropbox/core/v2/team/ApiApp$Builder;->linked:Ljava/util/Date;

    return-void

    .line 185
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'appName\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 181
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'appId\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/team/ApiApp;
    .locals 7

    .line 237
    new-instance v0, Lcom/dropbox/core/v2/team/ApiApp;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/ApiApp$Builder;->appId:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/ApiApp$Builder;->appName:Ljava/lang/String;

    iget-boolean v3, p0, Lcom/dropbox/core/v2/team/ApiApp$Builder;->isAppFolder:Z

    iget-object v4, p0, Lcom/dropbox/core/v2/team/ApiApp$Builder;->publisher:Ljava/lang/String;

    iget-object v5, p0, Lcom/dropbox/core/v2/team/ApiApp$Builder;->publisherUrl:Ljava/lang/String;

    iget-object v6, p0, Lcom/dropbox/core/v2/team/ApiApp$Builder;->linked:Ljava/util/Date;

    invoke-direct/range {v0 .. v6}, Lcom/dropbox/core/v2/team/ApiApp;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/util/Date;)V

    return-object v0
.end method

.method public withLinked(Ljava/util/Date;)Lcom/dropbox/core/v2/team/ApiApp$Builder;
    .locals 0

    .line 226
    invoke-static {p1}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/team/ApiApp$Builder;->linked:Ljava/util/Date;

    return-object p0
.end method

.method public withPublisher(Ljava/lang/String;)Lcom/dropbox/core/v2/team/ApiApp$Builder;
    .locals 0

    .line 202
    iput-object p1, p0, Lcom/dropbox/core/v2/team/ApiApp$Builder;->publisher:Ljava/lang/String;

    return-object p0
.end method

.method public withPublisherUrl(Ljava/lang/String;)Lcom/dropbox/core/v2/team/ApiApp$Builder;
    .locals 0

    .line 214
    iput-object p1, p0, Lcom/dropbox/core/v2/team/ApiApp$Builder;->publisherUrl:Ljava/lang/String;

    return-object p0
.end method
