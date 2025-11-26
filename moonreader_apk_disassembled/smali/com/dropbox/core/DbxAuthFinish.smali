.class public final Lcom/dropbox/core/DbxAuthFinish;
.super Ljava/lang/Object;
.source "DbxAuthFinish.java"


# static fields
.field public static final AccessTokenReader:Lcom/dropbox/core/json/JsonReader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/dropbox/core/json/JsonReader<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final BearerTokenTypeReader:Lcom/dropbox/core/json/JsonReader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/dropbox/core/json/JsonReader<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final Reader:Lcom/dropbox/core/json/JsonReader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/dropbox/core/json/JsonReader<",
            "Lcom/dropbox/core/DbxAuthFinish;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final accessToken:Ljava/lang/String;

.field private final accountId:Ljava/lang/String;

.field private final expiresIn:Ljava/lang/Long;

.field private issueTime:J

.field private final refreshToken:Ljava/lang/String;

.field private final scope:Ljava/lang/String;

.field private final teamId:Ljava/lang/String;

.field private final urlState:Ljava/lang/String;

.field private final userId:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 210
    new-instance v0, Lcom/dropbox/core/DbxAuthFinish$1;

    invoke-direct {v0}, Lcom/dropbox/core/DbxAuthFinish$1;-><init>()V

    sput-object v0, Lcom/dropbox/core/DbxAuthFinish;->Reader:Lcom/dropbox/core/json/JsonReader;

    .line 284
    new-instance v0, Lcom/dropbox/core/DbxAuthFinish$2;

    invoke-direct {v0}, Lcom/dropbox/core/DbxAuthFinish$2;-><init>()V

    sput-object v0, Lcom/dropbox/core/DbxAuthFinish;->BearerTokenTypeReader:Lcom/dropbox/core/json/JsonReader;

    .line 301
    new-instance v0, Lcom/dropbox/core/DbxAuthFinish$3;

    invoke-direct {v0}, Lcom/dropbox/core/DbxAuthFinish$3;-><init>()V

    sput-object v0, Lcom/dropbox/core/DbxAuthFinish;->AccessTokenReader:Lcom/dropbox/core/json/JsonReader;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9

    const/4 v8, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    move-object/from16 v7, p7

    .line 57
    invoke-direct/range {v0 .. v8}, Lcom/dropbox/core/DbxAuthFinish;-><init>(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    iput-object p1, p0, Lcom/dropbox/core/DbxAuthFinish;->accessToken:Ljava/lang/String;

    .line 80
    iput-object p2, p0, Lcom/dropbox/core/DbxAuthFinish;->expiresIn:Ljava/lang/Long;

    .line 81
    iput-object p3, p0, Lcom/dropbox/core/DbxAuthFinish;->refreshToken:Ljava/lang/String;

    .line 82
    iput-object p4, p0, Lcom/dropbox/core/DbxAuthFinish;->userId:Ljava/lang/String;

    .line 83
    iput-object p6, p0, Lcom/dropbox/core/DbxAuthFinish;->accountId:Ljava/lang/String;

    .line 84
    iput-object p5, p0, Lcom/dropbox/core/DbxAuthFinish;->teamId:Ljava/lang/String;

    .line 85
    iput-object p7, p0, Lcom/dropbox/core/DbxAuthFinish;->urlState:Ljava/lang/String;

    .line 86
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/dropbox/core/DbxAuthFinish;->issueTime:J

    .line 87
    iput-object p8, p0, Lcom/dropbox/core/DbxAuthFinish;->scope:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v4, p2

    move-object v6, p3

    move-object v5, p4

    move-object v7, p5

    .line 39
    invoke-direct/range {v0 .. v7}, Lcom/dropbox/core/DbxAuthFinish;-><init>(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getAccessToken()Ljava/lang/String;
    .locals 1

    .line 97
    iget-object v0, p0, Lcom/dropbox/core/DbxAuthFinish;->accessToken:Ljava/lang/String;

    return-object v0
.end method

.method public getAccountId()Ljava/lang/String;
    .locals 1

    .line 146
    iget-object v0, p0, Lcom/dropbox/core/DbxAuthFinish;->accountId:Ljava/lang/String;

    return-object v0
.end method

.method public getExpiresAt()Ljava/lang/Long;
    .locals 7

    .line 110
    iget-object v0, p0, Lcom/dropbox/core/DbxAuthFinish;->expiresIn:Ljava/lang/Long;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 113
    :cond_0
    iget-wide v1, p0, Lcom/dropbox/core/DbxAuthFinish;->issueTime:J

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    const-wide/16 v5, 0x3e8

    mul-long v3, v3, v5

    add-long/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public getRefreshToken()Ljava/lang/String;
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/dropbox/core/DbxAuthFinish;->refreshToken:Ljava/lang/String;

    return-object v0
.end method

.method public getScope()Ljava/lang/String;
    .locals 1

    .line 168
    iget-object v0, p0, Lcom/dropbox/core/DbxAuthFinish;->scope:Ljava/lang/String;

    return-object v0
.end method

.method public getTeamId()Ljava/lang/String;
    .locals 1

    .line 156
    iget-object v0, p0, Lcom/dropbox/core/DbxAuthFinish;->teamId:Ljava/lang/String;

    return-object v0
.end method

.method public getUrlState()Ljava/lang/String;
    .locals 1

    .line 179
    iget-object v0, p0, Lcom/dropbox/core/DbxAuthFinish;->urlState:Ljava/lang/String;

    return-object v0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 1

    .line 136
    iget-object v0, p0, Lcom/dropbox/core/DbxAuthFinish;->userId:Ljava/lang/String;

    return-object v0
.end method

.method setIssueTime(J)V
    .locals 0

    .line 186
    iput-wide p1, p0, Lcom/dropbox/core/DbxAuthFinish;->issueTime:J

    return-void
.end method

.method withUrlState(Ljava/lang/String;)Lcom/dropbox/core/DbxAuthFinish;
    .locals 10

    .line 196
    iget-object v0, p0, Lcom/dropbox/core/DbxAuthFinish;->urlState:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 200
    new-instance v1, Lcom/dropbox/core/DbxAuthFinish;

    iget-object v2, p0, Lcom/dropbox/core/DbxAuthFinish;->accessToken:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/DbxAuthFinish;->expiresIn:Ljava/lang/Long;

    iget-object v4, p0, Lcom/dropbox/core/DbxAuthFinish;->refreshToken:Ljava/lang/String;

    iget-object v5, p0, Lcom/dropbox/core/DbxAuthFinish;->userId:Ljava/lang/String;

    iget-object v6, p0, Lcom/dropbox/core/DbxAuthFinish;->teamId:Ljava/lang/String;

    iget-object v7, p0, Lcom/dropbox/core/DbxAuthFinish;->accountId:Ljava/lang/String;

    iget-object v9, p0, Lcom/dropbox/core/DbxAuthFinish;->scope:Ljava/lang/String;

    move-object v8, p1

    invoke-direct/range {v1 .. v9}, Lcom/dropbox/core/DbxAuthFinish;-><init>(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    iget-wide v2, p0, Lcom/dropbox/core/DbxAuthFinish;->issueTime:J

    invoke-virtual {v1, v2, v3}, Lcom/dropbox/core/DbxAuthFinish;->setIssueTime(J)V

    return-object v1

    .line 197
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Already have URL state."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
