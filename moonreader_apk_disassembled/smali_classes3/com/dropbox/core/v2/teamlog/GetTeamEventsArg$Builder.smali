.class public Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Builder;
.super Ljava/lang/Object;
.source "GetTeamEventsArg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected accountId:Ljava/lang/String;

.field protected category:Lcom/dropbox/core/v2/teamlog/EventCategory;

.field protected eventType:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

.field protected limit:J

.field protected time:Lcom/dropbox/core/v2/teamcommon/TimeRange;


# direct methods
.method protected constructor <init>()V
    .locals 2

    .line 166
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x3e8

    .line 167
    iput-wide v0, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Builder;->limit:J

    const/4 v0, 0x0

    .line 168
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Builder;->accountId:Ljava/lang/String;

    .line 169
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Builder;->time:Lcom/dropbox/core/v2/teamcommon/TimeRange;

    .line 170
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Builder;->category:Lcom/dropbox/core/v2/teamlog/EventCategory;

    .line 171
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Builder;->eventType:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg;
    .locals 7

    .line 281
    new-instance v0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg;

    iget-wide v1, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Builder;->limit:J

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Builder;->accountId:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Builder;->time:Lcom/dropbox/core/v2/teamcommon/TimeRange;

    iget-object v5, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Builder;->category:Lcom/dropbox/core/v2/teamlog/EventCategory;

    iget-object v6, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Builder;->eventType:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    invoke-direct/range {v0 .. v6}, Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg;-><init>(JLjava/lang/String;Lcom/dropbox/core/v2/teamcommon/TimeRange;Lcom/dropbox/core/v2/teamlog/EventCategory;Lcom/dropbox/core/v2/teamlog/EventTypeArg;)V

    return-object v0
.end method

.method public withAccountId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Builder;
    .locals 2

    if-eqz p1, :cond_2

    .line 223
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x28

    if-lt v0, v1, :cond_1

    .line 226
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-gt v0, v1, :cond_0

    goto :goto_0

    .line 227
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'accountId\' is longer than 40"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 224
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'accountId\' is shorter than 40"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 230
    :cond_2
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Builder;->accountId:Ljava/lang/String;

    return-object p0
.end method

.method public withCategory(Lcom/dropbox/core/v2/teamlog/EventCategory;)Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Builder;
    .locals 0

    .line 256
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Builder;->category:Lcom/dropbox/core/v2/teamlog/EventCategory;

    return-object p0
.end method

.method public withEventType(Lcom/dropbox/core/v2/teamlog/EventTypeArg;)Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Builder;
    .locals 0

    .line 270
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Builder;->eventType:Lcom/dropbox/core/v2/teamlog/EventTypeArg;

    return-object p0
.end method

.method public withLimit(Ljava/lang/Long;)Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Builder;
    .locals 5

    .line 194
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x1

    cmp-long v4, v0, v2

    if-ltz v4, :cond_2

    .line 197
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    cmp-long v4, v0, v2

    if-gtz v4, :cond_1

    if-eqz p1, :cond_0

    .line 201
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Builder;->limit:J

    return-object p0

    .line 204
    :cond_0
    iput-wide v2, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Builder;->limit:J

    return-object p0

    .line 198
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Number \'limit\' is larger than 1000L"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 195
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Number \'limit\' is smaller than 1L"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public withTime(Lcom/dropbox/core/v2/teamcommon/TimeRange;)Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Builder;
    .locals 0

    .line 242
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/GetTeamEventsArg$Builder;->time:Lcom/dropbox/core/v2/teamcommon/TimeRange;

    return-object p0
.end method
