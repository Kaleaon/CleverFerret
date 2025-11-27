.class public final Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;
.super Ljava/lang/Object;
.source "FileMemberRemoveActionResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Serializer;,
        Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;
    }
.end annotation


# static fields
.field public static final OTHER:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;


# instance fields
.field private _tag:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;

.field private memberErrorValue:Lcom/dropbox/core/v2/sharing/FileMemberActionError;

.field private successValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 62
    new-instance v0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;

    invoke-direct {v0, v1}, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->withTag(Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;)Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;

    move-result-object v0

    sput-object v0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->OTHER:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;)Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->successValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;)Lcom/dropbox/core/v2/sharing/FileMemberActionError;
    .locals 0

    .line 29
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->memberErrorValue:Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    return-object p0
.end method

.method public static memberError(Lcom/dropbox/core/v2/sharing/FileMemberActionError;)Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;
    .locals 2

    if-eqz p0, :cond_0

    .line 211
    new-instance v0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;->MEMBER_ERROR:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->withTagAndMemberError(Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;Lcom/dropbox/core/v2/sharing/FileMemberActionError;)Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;

    move-result-object p0

    return-object p0

    .line 209
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static success(Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;)Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;
    .locals 2

    if-eqz p0, :cond_0

    .line 163
    new-instance v0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->withTagAndSuccess(Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;)Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;

    move-result-object p0

    return-object p0

    .line 161
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private withTag(Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;)Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;
    .locals 1

    .line 80
    new-instance v0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;-><init>()V

    .line 81
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;

    return-object v0
.end method

.method private withTagAndMemberError(Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;Lcom/dropbox/core/v2/sharing/FileMemberActionError;)Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;
    .locals 1

    .line 111
    new-instance v0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;-><init>()V

    .line 112
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;

    .line 113
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->memberErrorValue:Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    return-object v0
.end method

.method private withTagAndSuccess(Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;)Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;
    .locals 1

    .line 95
    new-instance v0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;-><init>()V

    .line 96
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;

    .line 97
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->successValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;

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

    .line 261
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;

    if-eqz v2, :cond_a

    .line 262
    check-cast p1, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;

    .line 263
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 266
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$1;->$SwitchMap$com$dropbox$core$v2$sharing$FileMemberRemoveActionResult$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;->ordinal()I

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

    .line 270
    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->memberErrorValue:Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->memberErrorValue:Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    if-eq v2, p1, :cond_6

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    .line 268
    :cond_7
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->successValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->successValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;

    if-eq v2, p1, :cond_9

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;->equals(Ljava/lang/Object;)Z

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

.method public getMemberErrorValue()Lcom/dropbox/core/v2/sharing/FileMemberActionError;
    .locals 3

    .line 226
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;->MEMBER_ERROR:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;

    if-ne v0, v1, :cond_0

    .line 229
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->memberErrorValue:Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    return-object v0

    .line 227
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.MEMBER_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSuccessValue()Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;
    .locals 3

    .line 177
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;

    if-ne v0, v1, :cond_0

    .line 180
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->successValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;

    return-object v0

    .line 178
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.SUCCESS, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 245
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->successValue:Lcom/dropbox/core/v2/sharing/MemberAccessLevelResult;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->memberErrorValue:Lcom/dropbox/core/v2/sharing/FileMemberActionError;

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

    return v0
.end method

.method public isMemberError()Z
    .locals 2

    .line 191
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;->MEMBER_ERROR:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isOther()Z
    .locals 2

    .line 240
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;->OTHER:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSuccess()Z
    .locals 2

    .line 143
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;
    .locals 1

    .line 132
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 284
    sget-object v0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 296
    sget-object v0, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/FileMemberRemoveActionResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
