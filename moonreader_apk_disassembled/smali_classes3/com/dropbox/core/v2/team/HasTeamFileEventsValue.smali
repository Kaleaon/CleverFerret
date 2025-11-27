.class public final Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;
.super Ljava/lang/Object;
.source "HasTeamFileEventsValue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Serializer;,
        Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;

.field private enabledValue:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 60
    new-instance v0, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;->OTHER:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;->withTag(Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;)Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;->OTHER:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;)Ljava/lang/Boolean;
    .locals 0

    .line 31
    iget-object p0, p0, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;->enabledValue:Ljava/lang/Boolean;

    return-object p0
.end method

.method public static enabled(Z)Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;
    .locals 2

    .line 137
    new-instance v0, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;->ENABLED:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;->withTagAndEnabled(Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;

    move-result-object p0

    return-object p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;)Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;
    .locals 1

    .line 78
    new-instance v0, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;-><init>()V

    .line 79
    iput-object p1, v0, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;->_tag:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;

    return-object v0
.end method

.method private withTagAndEnabled(Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;
    .locals 1

    .line 90
    new-instance v0, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;-><init>()V

    .line 91
    iput-object p1, v0, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;->_tag:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;

    .line 92
    iput-object p2, v0, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;->enabledValue:Ljava/lang/Boolean;

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

    .line 185
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;

    if-eqz v2, :cond_5

    .line 186
    check-cast p1, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;

    .line 187
    iget-object v2, p0, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;->_tag:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;->_tag:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 190
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$1;->$SwitchMap$com$dropbox$core$v2$team$HasTeamFileEventsValue$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;->_tag:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_4

    const/4 p1, 0x2

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 192
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;->enabledValue:Ljava/lang/Boolean;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;->enabledValue:Ljava/lang/Boolean;

    if-ne v2, p1, :cond_5

    return v0

    :cond_5
    return v1
.end method

.method public getEnabledValue()Z
    .locals 3

    .line 151
    iget-object v0, p0, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;->_tag:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;->ENABLED:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;

    if-ne v0, v1, :cond_0

    .line 154
    iget-object v0, p0, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;->enabledValue:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    .line 152
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ENABLED, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;->_tag:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 4

    .line 170
    iget-object v0, p0, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;->_tag:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;->enabledValue:Ljava/lang/Boolean;

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

.method public isEnabled()Z
    .locals 2

    .line 122
    iget-object v0, p0, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;->_tag:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;->ENABLED:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 165
    iget-object v0, p0, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;->_tag:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;->OTHER:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;
    .locals 1

    .line 111
    iget-object v0, p0, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue;->_tag:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 206
    sget-object v0, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 218
    sget-object v0, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/HasTeamFileEventsValue$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
