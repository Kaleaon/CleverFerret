.class public final Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;
.super Ljava/lang/Object;
.source "MembersGetInfoItemV2.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Serializer;,
        Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;

.field private idNotFoundValue:Ljava/lang/String;

.field private memberInfoValue:Lcom/dropbox/core/v2/team/TeamMemberInfoV2;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 69
    new-instance v0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;->OTHER:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->withTag(Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;)Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->OTHER:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;)Ljava/lang/String;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->idNotFoundValue:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;)Lcom/dropbox/core/v2/team/TeamMemberInfoV2;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->memberInfoValue:Lcom/dropbox/core/v2/team/TeamMemberInfoV2;

    return-object p0
.end method

.method public static idNotFound(Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;
    .locals 2

    if-eqz p0, :cond_0

    .line 187
    new-instance v0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;->ID_NOT_FOUND:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->withTagAndIdNotFound(Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;

    move-result-object p0

    return-object p0

    .line 185
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static memberInfo(Lcom/dropbox/core/v2/team/TeamMemberInfoV2;)Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;
    .locals 2

    if-eqz p0, :cond_0

    .line 239
    new-instance v0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;->MEMBER_INFO:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->withTagAndMemberInfo(Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;Lcom/dropbox/core/v2/team/TeamMemberInfoV2;)Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;

    move-result-object p0

    return-object p0

    .line 237
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;)Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;
    .locals 1

    .line 90
    new-instance v0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;-><init>()V

    .line 91
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->_tag:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;

    return-object v0
.end method

.method private withTagAndIdNotFound(Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;Ljava/lang/String;)Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;
    .locals 1

    .line 112
    new-instance v0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;-><init>()V

    .line 113
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->_tag:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;

    .line 114
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->idNotFoundValue:Ljava/lang/String;

    return-object v0
.end method

.method private withTagAndMemberInfo(Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;Lcom/dropbox/core/v2/team/TeamMemberInfoV2;)Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;
    .locals 1

    .line 131
    new-instance v0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;

    invoke-direct {v0}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;-><init>()V

    .line 132
    iput-object p1, v0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->_tag:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;

    .line 133
    iput-object p2, v0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->memberInfoValue:Lcom/dropbox/core/v2/team/TeamMemberInfoV2;

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

    .line 289
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;

    if-eqz v2, :cond_a

    .line 290
    check-cast p1, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;

    .line 291
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->_tag:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->_tag:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 294
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$1;->$SwitchMap$com$dropbox$core$v2$team$MembersGetInfoItemV2$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->_tag:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_7

    const/4 v3, 0x2

    if-eq v2, v3, :cond_4

    const/4 p1, 0x3

    if-eq v2, p1, :cond_3

    return v1

    :cond_3
    return v0

    .line 298
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->memberInfoValue:Lcom/dropbox/core/v2/team/TeamMemberInfoV2;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->memberInfoValue:Lcom/dropbox/core/v2/team/TeamMemberInfoV2;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/team/TeamMemberInfoV2;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    .line 296
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->idNotFoundValue:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->idNotFoundValue:Ljava/lang/String;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_8

    goto :goto_1

    :cond_8
    return v1

    :cond_9
    :goto_1
    return v0

    :cond_a
    return v1
.end method

.method public getIdNotFoundValue()Ljava/lang/String;
    .locals 3

    .line 205
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->_tag:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;->ID_NOT_FOUND:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;

    if-ne v0, v1, :cond_0

    .line 208
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->idNotFoundValue:Ljava/lang/String;

    return-object v0

    .line 206
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.ID_NOT_FOUND, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->_tag:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getMemberInfoValue()Lcom/dropbox/core/v2/team/TeamMemberInfoV2;
    .locals 3

    .line 253
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->_tag:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;->MEMBER_INFO:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;

    if-ne v0, v1, :cond_0

    .line 256
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->memberInfoValue:Lcom/dropbox/core/v2/team/TeamMemberInfoV2;

    return-object v0

    .line 254
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.MEMBER_INFO, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->_tag:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 272
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->_tag:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->idNotFoundValue:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->memberInfoValue:Lcom/dropbox/core/v2/team/TeamMemberInfoV2;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    invoke-static {v3}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    .line 277
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public isIdNotFound()Z
    .locals 2

    .line 163
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->_tag:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;->ID_NOT_FOUND:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isMemberInfo()Z
    .locals 2

    .line 219
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->_tag:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;->MEMBER_INFO:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 267
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->_tag:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;

    sget-object v1, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;->OTHER:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;
    .locals 1

    .line 152
    iget-object v0, p0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2;->_tag:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 312
    sget-object v0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 324
    sget-object v0, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Serializer;->INSTANCE:Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/team/MembersGetInfoItemV2$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
