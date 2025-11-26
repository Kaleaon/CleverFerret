.class public final Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;
.super Ljava/lang/Object;
.source "HasTeamSelectiveSyncValue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;,
        Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;

.field private hasTeamSelectiveSyncValue:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 60
    new-instance v0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;->OTHER:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;->withTag(Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;)Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;->OTHER:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;)Ljava/lang/Boolean;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;->hasTeamSelectiveSyncValue:Ljava/lang/Boolean;

    return-object p0
.end method

.method public static hasTeamSelectiveSync(Z)Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;
    .locals 2

    .line 138
    new-instance v0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;->HAS_TEAM_SELECTIVE_SYNC:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;->withTagAndHasTeamSelectiveSync(Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;

    move-result-object p0

    return-object p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;)Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;
    .locals 1

    .line 78
    new-instance v0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;-><init>()V

    .line 79
    iput-object p1, v0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;->_tag:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;

    return-object v0
.end method

.method private withTagAndHasTeamSelectiveSync(Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;
    .locals 1

    .line 91
    new-instance v0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;-><init>()V

    .line 92
    iput-object p1, v0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;->_tag:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;

    .line 93
    iput-object p2, v0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;->hasTeamSelectiveSyncValue:Ljava/lang/Boolean;

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

    .line 188
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;

    if-eqz v2, :cond_5

    .line 189
    check-cast p1, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;

    .line 190
    iget-object v2, p0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;->_tag:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;->_tag:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 193
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$1;->$SwitchMap$com$dropbox$core$v2$team$HasTeamSelectiveSyncValue$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;->_tag:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_4

    const/4 p1, 0x2

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 195
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;->hasTeamSelectiveSyncValue:Ljava/lang/Boolean;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;->hasTeamSelectiveSyncValue:Ljava/lang/Boolean;

    if-ne v2, p1, :cond_5

    return v0

    :cond_5
    return v1
.end method

.method public getHasTeamSelectiveSyncValue()Z
    .locals 3

    .line 154
    iget-object v0, p0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;->_tag:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;->HAS_TEAM_SELECTIVE_SYNC:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;

    if-ne v0, v1, :cond_0

    .line 157
    iget-object v0, p0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;->hasTeamSelectiveSyncValue:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    .line 155
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.HAS_TEAM_SELECTIVE_SYNC, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;->_tag:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 173
    iget-object v0, p0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;->_tag:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;->hasTeamSelectiveSyncValue:Ljava/lang/Boolean;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isHasTeamSelectiveSync()Z
    .locals 2

    .line 123
    iget-object v0, p0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;->_tag:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;->HAS_TEAM_SELECTIVE_SYNC:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 168
    iget-object v0, p0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;->_tag:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;->OTHER:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;
    .locals 1

    .line 112
    iget-object v0, p0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue;->_tag:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 209
    sget-object v0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 221
    sget-object v0, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/HasTeamSelectiveSyncValue$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
