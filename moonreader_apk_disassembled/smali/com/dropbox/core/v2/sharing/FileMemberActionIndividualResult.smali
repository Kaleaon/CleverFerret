.class public final Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;
.super Ljava/lang/Object;
.source "FileMemberActionIndividualResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Serializer;,
        Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;
    }
.end annotation


# instance fields
.field private _tag:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;

.field private memberErrorValue:Lcom/dropbox/core/v2/sharing/FileMemberActionError;

.field private successValue:Lcom/dropbox/core/v2/sharing/AccessLevel;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;)Lcom/dropbox/core/v2/sharing/AccessLevel;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->successValue:Lcom/dropbox/core/v2/sharing/AccessLevel;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;)Lcom/dropbox/core/v2/sharing/FileMemberActionError;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->memberErrorValue:Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    return-object p0
.end method

.method public static memberError(Lcom/dropbox/core/v2/sharing/FileMemberActionError;)Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;
    .locals 2

    if-eqz p0, :cond_0

    .line 212
    new-instance v0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;->MEMBER_ERROR:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->withTagAndMemberError(Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;Lcom/dropbox/core/v2/sharing/FileMemberActionError;)Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;

    move-result-object p0

    return-object p0

    .line 210
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static success()Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;
    .locals 1

    const/4 v0, 0x0

    .line 160
    invoke-static {v0}, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->success(Lcom/dropbox/core/v2/sharing/AccessLevel;)Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;

    move-result-object v0

    return-object v0
.end method

.method public static success(Lcom/dropbox/core/v2/sharing/AccessLevel;)Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;
    .locals 2

    .line 143
    new-instance v0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;-><init>()V

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;

    invoke-direct {v0, v1, p0}, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->withTagAndSuccess(Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;Lcom/dropbox/core/v2/sharing/AccessLevel;)Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;

    move-result-object p0

    return-object p0
.end method

.method private withTag(Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;)Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;
    .locals 1

    .line 63
    new-instance v0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;-><init>()V

    .line 64
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;

    return-object v0
.end method

.method private withTagAndMemberError(Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;Lcom/dropbox/core/v2/sharing/FileMemberActionError;)Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;
    .locals 1

    .line 95
    new-instance v0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;-><init>()V

    .line 96
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;

    .line 97
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->memberErrorValue:Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    return-object v0
.end method

.method private withTagAndSuccess(Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;Lcom/dropbox/core/v2/sharing/AccessLevel;)Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;
    .locals 1

    .line 79
    new-instance v0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;

    invoke-direct {v0}, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;-><init>()V

    .line 80
    iput-object p1, v0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;

    .line 81
    iput-object p2, v0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->successValue:Lcom/dropbox/core/v2/sharing/AccessLevel;

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

    .line 251
    :cond_1
    instance-of v2, p1, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;

    if-eqz v2, :cond_9

    .line 252
    check-cast p1, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;

    .line 253
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;

    if-eq v2, v3, :cond_2

    return v1

    .line 256
    :cond_2
    sget-object v2, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$1;->$SwitchMap$com$dropbox$core$v2$sharing$FileMemberActionIndividualResult$Tag:[I

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;

    invoke-virtual {v3}, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;->ordinal()I

    move-result v3

    aget v2, v2, v3

    if-eq v2, v0, :cond_6

    const/4 v3, 0x2

    if-eq v2, v3, :cond_3

    return v1

    .line 260
    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->memberErrorValue:Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->memberErrorValue:Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    if-eq v2, p1, :cond_5

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/sharing/FileMemberActionError;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    return v1

    :cond_5
    :goto_0
    return v0

    .line 258
    :cond_6
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->successValue:Lcom/dropbox/core/v2/sharing/AccessLevel;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->successValue:Lcom/dropbox/core/v2/sharing/AccessLevel;

    if-eq v2, p1, :cond_8

    if-eqz v2, :cond_7

    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/sharing/AccessLevel;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_1

    :cond_7
    return v1

    :cond_8
    :goto_1
    return v0

    :cond_9
    return v1
.end method

.method public getMemberErrorValue()Lcom/dropbox/core/v2/sharing/FileMemberActionError;
    .locals 3

    .line 227
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;->MEMBER_ERROR:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;

    if-ne v0, v1, :cond_0

    .line 230
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->memberErrorValue:Lcom/dropbox/core/v2/sharing/FileMemberActionError;

    return-object v0

    .line 228
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.MEMBER_ERROR, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSuccessValue()Lcom/dropbox/core/v2/sharing/AccessLevel;
    .locals 3

    .line 178
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;

    if-ne v0, v1, :cond_0

    .line 181
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->successValue:Lcom/dropbox/core/v2/sharing/AccessLevel;

    return-object v0

    .line 179
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid tag: required Tag.SUCCESS, but was Tag."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;

    invoke-virtual {v2}, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 235
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->successValue:Lcom/dropbox/core/v2/sharing/AccessLevel;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->memberErrorValue:Lcom/dropbox/core/v2/sharing/FileMemberActionError;

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

    .line 192
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;->MEMBER_ERROR:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSuccess()Z
    .locals 2

    .line 124
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;

    sget-object v1, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;->SUCCESS:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public tag()Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;
    .locals 1

    .line 113
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->_tag:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Tag;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 272
    sget-object v0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 284
    sget-object v0, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
