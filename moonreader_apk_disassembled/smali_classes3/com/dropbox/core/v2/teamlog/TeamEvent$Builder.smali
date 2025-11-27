.class public Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;
.super Ljava/lang/Object;
.source "TeamEvent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/TeamEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected actor:Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

.field protected assets:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/teamlog/AssetLogInfo;",
            ">;"
        }
    .end annotation
.end field

.field protected context:Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

.field protected final details:Lcom/dropbox/core/v2/teamlog/EventDetails;

.field protected final eventCategory:Lcom/dropbox/core/v2/teamlog/EventCategory;

.field protected final eventType:Lcom/dropbox/core/v2/teamlog/EventType;

.field protected involveNonTeamMember:Ljava/lang/Boolean;

.field protected origin:Lcom/dropbox/core/v2/teamlog/OriginLogInfo;

.field protected participants:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;",
            ">;"
        }
    .end annotation
.end field

.field protected final timestamp:Ljava/util/Date;


# direct methods
.method protected constructor <init>(Ljava/util/Date;Lcom/dropbox/core/v2/teamlog/EventCategory;Lcom/dropbox/core/v2/teamlog/EventType;Lcom/dropbox/core/v2/teamlog/EventDetails;)V
    .locals 0

    .line 298
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_3

    .line 302
    invoke-static {p1}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->timestamp:Ljava/util/Date;

    if-eqz p2, :cond_2

    .line 306
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->eventCategory:Lcom/dropbox/core/v2/teamlog/EventCategory;

    if-eqz p3, :cond_1

    .line 310
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->eventType:Lcom/dropbox/core/v2/teamlog/EventType;

    if-eqz p4, :cond_0

    .line 314
    iput-object p4, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->details:Lcom/dropbox/core/v2/teamlog/EventDetails;

    const/4 p1, 0x0

    .line 315
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->actor:Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    .line 316
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->origin:Lcom/dropbox/core/v2/teamlog/OriginLogInfo;

    .line 317
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->involveNonTeamMember:Ljava/lang/Boolean;

    .line 318
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->context:Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    .line 319
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->participants:Ljava/util/List;

    .line 320
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->assets:Ljava/util/List;

    return-void

    .line 312
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'details\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 308
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'eventType\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 304
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'eventCategory\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 300
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'timestamp\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/TeamEvent;
    .locals 11

    .line 434
    new-instance v0, Lcom/dropbox/core/v2/teamlog/TeamEvent;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->timestamp:Ljava/util/Date;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->eventCategory:Lcom/dropbox/core/v2/teamlog/EventCategory;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->eventType:Lcom/dropbox/core/v2/teamlog/EventType;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->details:Lcom/dropbox/core/v2/teamlog/EventDetails;

    iget-object v5, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->actor:Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    iget-object v6, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->origin:Lcom/dropbox/core/v2/teamlog/OriginLogInfo;

    iget-object v7, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->involveNonTeamMember:Ljava/lang/Boolean;

    iget-object v8, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->context:Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    iget-object v9, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->participants:Ljava/util/List;

    iget-object v10, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->assets:Ljava/util/List;

    invoke-direct/range {v0 .. v10}, Lcom/dropbox/core/v2/teamlog/TeamEvent;-><init>(Ljava/util/Date;Lcom/dropbox/core/v2/teamlog/EventCategory;Lcom/dropbox/core/v2/teamlog/EventType;Lcom/dropbox/core/v2/teamlog/EventDetails;Lcom/dropbox/core/v2/teamlog/ActorLogInfo;Lcom/dropbox/core/v2/teamlog/OriginLogInfo;Ljava/lang/Boolean;Lcom/dropbox/core/v2/teamlog/ContextLogInfo;Ljava/util/List;Ljava/util/List;)V

    return-object v0
.end method

.method public withActor(Lcom/dropbox/core/v2/teamlog/ActorLogInfo;)Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;
    .locals 0

    .line 332
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->actor:Lcom/dropbox/core/v2/teamlog/ActorLogInfo;

    return-object p0
.end method

.method public withAssets(Ljava/util/List;)Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/teamlog/AssetLogInfo;",
            ">;)",
            "Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 417
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dropbox/core/v2/teamlog/AssetLogInfo;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 419
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'assets\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 423
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->assets:Ljava/util/List;

    return-object p0
.end method

.method public withContext(Lcom/dropbox/core/v2/teamlog/ContextLogInfo;)Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;
    .locals 0

    .line 374
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->context:Lcom/dropbox/core/v2/teamlog/ContextLogInfo;

    return-object p0
.end method

.method public withInvolveNonTeamMember(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;
    .locals 0

    .line 361
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->involveNonTeamMember:Ljava/lang/Boolean;

    return-object p0
.end method

.method public withOrigin(Lcom/dropbox/core/v2/teamlog/OriginLogInfo;)Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;
    .locals 0

    .line 347
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->origin:Lcom/dropbox/core/v2/teamlog/OriginLogInfo;

    return-object p0
.end method

.method public withParticipants(Ljava/util/List;)Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;",
            ">;)",
            "Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 392
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dropbox/core/v2/teamlog/ParticipantLogInfo;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 394
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'participants\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 398
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/TeamEvent$Builder;->participants:Ljava/util/List;

    return-object p0
.end method
