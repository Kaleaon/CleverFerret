.class public final Lcom/dropbox/core/v2/team/FeatureValue;
.super Ljava/lang/Object;
.source "FeatureValue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/FeatureValue$Serializer;,
        Lcom/dropbox/core/v2/team/FeatureValue$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/team/FeatureValue;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

.field private hasTeamFileEventsValue:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;

.field private hasTeamSelectiveSyncValue:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;

.field private hasTeamSharedDropboxValue:Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue;

.field private uploadApiRateLimitValue:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 61
    new-instance v0, Lcom/dropbox/core/v2/team/FeatureValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/FeatureValue;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/FeatureValue$Tag;->OTHER:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/FeatureValue;->withTag(Lcom/dropbox/core/v2/team/FeatureValue$Tag;)Lcom/dropbox/core/v2/team/FeatureValue;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/FeatureValue;->OTHER:Lcom/dropbox/core/v2/team/FeatureValue;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/FeatureValue;)Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/dropbox/core/v2/team/FeatureValue;->uploadApiRateLimitValue:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/team/FeatureValue;)Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/dropbox/core/v2/team/FeatureValue;->hasTeamSharedDropboxValue:Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dropbox/core/v2/team/FeatureValue;)Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/dropbox/core/v2/team/FeatureValue;->hasTeamFileEventsValue:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;

    return-object p0
.end method

.method static synthetic access$300(Lcom/dropbox/core/v2/team/FeatureValue;)Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/dropbox/core/v2/team/FeatureValue;->hasTeamSelectiveSyncValue:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;

    return-object p0
.end method

.method public static hasTeamFileEvents(Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;)Lcom/dropbox/core/v2/team/FeatureValue;
    .locals 2

    if-eqz p0, :cond_0

    .line 296
    new-instance v0, Lcom/dropbox/core/v2/team/FeatureValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/FeatureValue;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/FeatureValue$Tag;->HAS_TEAM_FILE_EVENTS:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/FeatureValue;->withTagAndHasTeamFileEvents(Lcom/dropbox/core/v2/team/FeatureValue$Tag;Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;)Lcom/dropbox/core/v2/team/FeatureValue;

    move-result-object p0

    return-object p0

    .line 294
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static hasTeamSelectiveSync(Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;)Lcom/dropbox/core/v2/team/FeatureValue;
    .locals 2

    if-eqz p0, :cond_0

    .line 343
    new-instance v0, Lcom/dropbox/core/v2/team/FeatureValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/FeatureValue;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/FeatureValue$Tag;->HAS_TEAM_SELECTIVE_SYNC:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/FeatureValue;->withTagAndHasTeamSelectiveSync(Lcom/dropbox/core/v2/team/FeatureValue$Tag;Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;)Lcom/dropbox/core/v2/team/FeatureValue;

    move-result-object p0

    return-object p0

    .line 341
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static hasTeamSharedDropbox(Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue;)Lcom/dropbox/core/v2/team/FeatureValue;
    .locals 2

    if-eqz p0, :cond_0

    .line 249
    new-instance v0, Lcom/dropbox/core/v2/team/FeatureValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/FeatureValue;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/FeatureValue$Tag;->HAS_TEAM_SHARED_DROPBOX:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/FeatureValue;->withTagAndHasTeamSharedDropbox(Lcom/dropbox/core/v2/team/FeatureValue$Tag;Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue;)Lcom/dropbox/core/v2/team/FeatureValue;

    move-result-object p0

    return-object p0

    .line 247
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static uploadApiRateLimit(Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;)Lcom/dropbox/core/v2/team/FeatureValue;
    .locals 2

    if-eqz p0, :cond_0

    .line 202
    new-instance v0, Lcom/dropbox/core/v2/team/FeatureValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/FeatureValue;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/FeatureValue$Tag;->UPLOAD_API_RATE_LIMIT:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/FeatureValue;->withTagAndUploadApiRateLimit(Lcom/dropbox/core/v2/team/FeatureValue$Tag;Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;)Lcom/dropbox/core/v2/team/FeatureValue;

    move-result-object p0

    return-object p0

    .line 200
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/FeatureValue$Tag;)Lcom/dropbox/core/v2/team/FeatureValue;
    .locals 1

    .line 83
    new-instance v0, Lcom/dropbox/core/v2/team/FeatureValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/FeatureValue;-><init>()V

    .line 84
    iput-object p1, v0, Lcom/dropbox/core/v2/team/FeatureValue;->_tag:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    return-object v0
.end method

.method private withTagAndHasTeamFileEvents(Lcom/dropbox/core/v2/team/FeatureValue$Tag;Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;)Lcom/dropbox/core/v2/team/FeatureValue;
    .locals 1

    .line 133
    new-instance v0, Lcom/dropbox/core/v2/team/FeatureValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/FeatureValue;-><init>()V

    .line 134
    iput-object p1, v0, Lcom/dropbox/core/v2/team/FeatureValue;->_tag:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    .line 135
    iput-object p2, v0, Lcom/dropbox/core/v2/team/FeatureValue;->hasTeamFileEventsValue:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;

    return-object v0
.end method

.method private withTagAndHasTeamSelectiveSync(Lcom/dropbox/core/v2/team/FeatureValue$Tag;Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;)Lcom/dropbox/core/v2/team/FeatureValue;
    .locals 1

    .line 150
    new-instance v0, Lcom/dropbox/core/v2/team/FeatureValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/FeatureValue;-><init>()V

    .line 151
    iput-object p1, v0, Lcom/dropbox/core/v2/team/FeatureValue;->_tag:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    .line 152
    iput-object p2, v0, Lcom/dropbox/core/v2/team/FeatureValue;->hasTeamSelectiveSyncValue:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;

    return-object v0
.end method

.method private withTagAndHasTeamSharedDropbox(Lcom/dropbox/core/v2/team/FeatureValue$Tag;Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue;)Lcom/dropbox/core/v2/team/FeatureValue;
    .locals 1

    .line 116
    new-instance v0, Lcom/dropbox/core/v2/team/FeatureValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/FeatureValue;-><init>()V

    .line 117
    iput-object p1, v0, Lcom/dropbox/core/v2/team/FeatureValue;->_tag:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    .line 118
    iput-object p2, v0, Lcom/dropbox/core/v2/team/FeatureValue;->hasTeamSharedDropboxValue:Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue;

    return-object v0
.end method

.method private withTagAndUploadApiRateLimit(Lcom/dropbox/core/v2/team/FeatureValue$Tag;Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;)Lcom/dropbox/core/v2/team/FeatureValue;
    .locals 1

    .line 99
    new-instance v0, Lcom/dropbox/core/v2/team/FeatureValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/FeatureValue;-><init>()V

    .line 100
    iput-object p1, v0, Lcom/dropbox/core/v2/team/FeatureValue;->_tag:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    .line 101
    iput-object p2, v0, Lcom/dropbox/core/v2/team/FeatureValue;->uploadApiRateLimitValue:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 393
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/FeatureValue;

    if-eqz v2, :cond_10

    .line 394
    check-cast p1, Lcom/dropbox/core/v2/team/FeatureValue;

    .line 395
    iget-object v2, p0, Lcom/dropbox/core/v2/team/FeatureValue;->_tag:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/FeatureValue;->_tag:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 398
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/FeatureValue$1;->$SwitchMap$com$dropbox$core$v2$team$FeatureValue$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/FeatureValue;->_tag:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/FeatureValue$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_d

    const/4 v3, 0x2

    if-eq v2, v3, :cond_a

    const/4 v3, 0x3

    if-eq v2, v3, :cond_7

    const/4 v3, 0x4

    if-eq v2, v3, :cond_4

    const/4 p1, 0x5

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 406
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/team/FeatureValue;->hasTeamSelectiveSyncValue:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/FeatureValue;->hasTeamSelectiveSyncValue:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    .line 404
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/team/FeatureValue;->hasTeamFileEventsValue:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/FeatureValue;->hasTeamFileEventsValue:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_8

    goto :goto_1

    :cond_8
    return v1

    :cond_9
    :goto_1
    return v0

    .line 402
    :cond_a
    iget-object v2, p0, Lcom/dropbox/core/v2/team/FeatureValue;->hasTeamSharedDropboxValue:Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/FeatureValue;->hasTeamSharedDropboxValue:Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue;

    if-eq v2, p1, :cond_c

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_b

    goto :goto_2

    :cond_b
    return v1

    :cond_c
    :goto_2
    return v0

    .line 400
    :cond_d
    iget-object v2, p0, Lcom/dropbox/core/v2/team/FeatureValue;->uploadApiRateLimitValue:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/FeatureValue;->uploadApiRateLimitValue:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;

    if-eq v2, p1, :cond_f

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_e

    goto :goto_3

    :cond_e
    return v1

    :cond_f
    :goto_3
    return v0

    :cond_10
    return v1
.end method

.method public getHasTeamFileEventsValue()Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;
    .locals 3

    .line 309
    iget-object v0, p0, Lcom/dropbox/core/v2/team/FeatureValue;->_tag:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/FeatureValue$Tag;->HAS_TEAM_FILE_EVENTS:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    if-ne v0, v1, :cond_0

    .line 312
    iget-object v0, p0, Lcom/dropbox/core/v2/team/FeatureValue;->hasTeamFileEventsValue:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;

    return-object v0

    .line 310
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.HAS_TEAM_FILE_EVENTS, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/FeatureValue;->_tag:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/FeatureValue$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getHasTeamSelectiveSyncValue()Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;
    .locals 3

    .line 356
    iget-object v0, p0, Lcom/dropbox/core/v2/team/FeatureValue;->_tag:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/FeatureValue$Tag;->HAS_TEAM_SELECTIVE_SYNC:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    if-ne v0, v1, :cond_0

    .line 359
    iget-object v0, p0, Lcom/dropbox/core/v2/team/FeatureValue;->hasTeamSelectiveSyncValue:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;

    return-object v0

    .line 357
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.HAS_TEAM_SELECTIVE_SYNC, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/FeatureValue;->_tag:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/FeatureValue$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getHasTeamSharedDropboxValue()Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue;
    .locals 3

    .line 262
    iget-object v0, p0, Lcom/dropbox/core/v2/team/FeatureValue;->_tag:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/FeatureValue$Tag;->HAS_TEAM_SHARED_DROPBOX:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    if-ne v0, v1, :cond_0

    .line 265
    iget-object v0, p0, Lcom/dropbox/core/v2/team/FeatureValue;->hasTeamSharedDropboxValue:Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue;

    return-object v0

    .line 263
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.HAS_TEAM_SHARED_DROPBOX, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/FeatureValue;->_tag:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/FeatureValue$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getUploadApiRateLimitValue()Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;
    .locals 3

    .line 215
    iget-object v0, p0, Lcom/dropbox/core/v2/team/FeatureValue;->_tag:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/FeatureValue$Tag;->UPLOAD_API_RATE_LIMIT:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    if-ne v0, v1, :cond_0

    .line 218
    iget-object v0, p0, Lcom/dropbox/core/v2/team/FeatureValue;->uploadApiRateLimitValue:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;

    return-object v0

    .line 216
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.UPLOAD_API_RATE_LIMIT, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/FeatureValue;->_tag:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/FeatureValue$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 7

    .line 375
    iget-object v0, p0, Lcom/dropbox/core/v2/team/FeatureValue;->_tag:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/FeatureValue;->uploadApiRateLimitValue:Lcom/dropbox/core/v2/team/UploadApiRateLimitValue;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/FeatureValue;->hasTeamSharedDropboxValue:Lcom/dropbox/core/v2/team/HasTeamSharedDropboxValue;

    iget-object v3, p0, Lcom/dropbox/core/v2/team/FeatureValue;->hasTeamFileEventsValue:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;

    iget-object v4, p0, Lcom/dropbox/core/v2/team/FeatureValue;->hasTeamSelectiveSyncValue:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;

    const/4 v5, 0x5

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    const/4 v0, 0x1

    aput-object v1, v5, v0

    const/4 v0, 0x2

    aput-object v2, v5, v0

    const/4 v0, 0x3

    aput-object v3, v5, v0

    const/4 v0, 0x4

    aput-object v4, v5, v0

    invoke-static {v5}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isHasTeamFileEvents()Z
    .locals 2

    .line 276
    iget-object v0, p0, Lcom/dropbox/core/v2/team/FeatureValue;->_tag:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/FeatureValue$Tag;->HAS_TEAM_FILE_EVENTS:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isHasTeamSelectiveSync()Z
    .locals 2

    .line 323
    iget-object v0, p0, Lcom/dropbox/core/v2/team/FeatureValue;->_tag:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/FeatureValue$Tag;->HAS_TEAM_SELECTIVE_SYNC:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isHasTeamSharedDropbox()Z
    .locals 2

    .line 229
    iget-object v0, p0, Lcom/dropbox/core/v2/team/FeatureValue;->_tag:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/FeatureValue$Tag;->HAS_TEAM_SHARED_DROPBOX:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 370
    iget-object v0, p0, Lcom/dropbox/core/v2/team/FeatureValue;->_tag:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/FeatureValue$Tag;->OTHER:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isUploadApiRateLimit()Z
    .locals 2

    .line 182
    iget-object v0, p0, Lcom/dropbox/core/v2/team/FeatureValue;->_tag:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/FeatureValue$Tag;->UPLOAD_API_RATE_LIMIT:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/FeatureValue$Tag;
    .locals 1

    .line 171
    iget-object v0, p0, Lcom/dropbox/core/v2/team/FeatureValue;->_tag:Lcom/dropbox/core/v2/team/FeatureValue$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 420
    sget-object v0, Lcom/dropbox/core/v2/team/FeatureValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/FeatureValue$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/FeatureValue$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 432
    sget-object v0, Lcom/dropbox/core/v2/team/FeatureValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/FeatureValue$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/FeatureValue$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
