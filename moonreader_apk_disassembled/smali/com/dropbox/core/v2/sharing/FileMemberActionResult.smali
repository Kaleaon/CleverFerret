.class public Lcom/dropbox/core/v2/sharing/FileMemberActionResult;
.super Ljava/lang/Object;
.source "FileMemberActionResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/sharing/FileMemberActionResult$Serializer;,
        Lcom/dropbox/core/v2/sharing/FileMemberActionResult$Builder;
    }
.end annotation


# instance fields
.field protected final invitationSignature:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final member:Lcom/dropbox/core/v2/sharing/MemberSelector;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final result:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final sckeySha1:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/sharing/MemberSelector;Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;)V
    .locals 1
    .param p1    # Lcom/dropbox/core/v2/sharing/MemberSelector;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 92
    invoke-direct {p0, p1, p2, v0, v0}, Lcom/dropbox/core/v2/sharing/FileMemberActionResult;-><init>(Lcom/dropbox/core/v2/sharing/MemberSelector;Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/v2/sharing/MemberSelector;Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;Ljava/lang/String;Ljava/util/List;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/sharing/MemberSelector;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/v2/sharing/MemberSelector;",
            "Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_3

    .line 62
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult;->member:Lcom/dropbox/core/v2/sharing/MemberSelector;

    if-eqz p2, :cond_2

    .line 66
    iput-object p2, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult;->result:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;

    .line 67
    iput-object p3, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult;->sckeySha1:Ljava/lang/String;

    if-eqz p4, :cond_1

    .line 69
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    if-eqz p2, :cond_0

    goto :goto_0

    .line 71
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'invitationSignature\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 75
    :cond_1
    iput-object p4, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult;->invitationSignature:Ljava/util/List;

    return-void

    .line 64
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'result\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 60
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'member\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(Lcom/dropbox/core/v2/sharing/MemberSelector;Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;)Lcom/dropbox/core/v2/sharing/FileMemberActionResult$Builder;
    .locals 1

    .line 150
    new-instance v0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult$Builder;

    invoke-direct {v0, p0, p1}, Lcom/dropbox/core/v2/sharing/FileMemberActionResult$Builder;-><init>(Lcom/dropbox/core/v2/sharing/MemberSelector;Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;)V

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

    .line 244
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 245
    check-cast p1, Lcom/dropbox/core/v2/sharing/FileMemberActionResult;

    .line 246
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult;->member:Lcom/dropbox/core/v2/sharing/MemberSelector;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/FileMemberActionResult;->member:Lcom/dropbox/core/v2/sharing/MemberSelector;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/sharing/MemberSelector;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult;->result:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/FileMemberActionResult;->result:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;

    if-eq v2, v3, :cond_3

    .line 247
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult;->sckeySha1:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/sharing/FileMemberActionResult;->sckeySha1:Ljava/lang/String;

    if-eq v2, v3, :cond_4

    if-eqz v2, :cond_5

    .line 248
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult;->invitationSignature:Ljava/util/List;

    iget-object p1, p1, Lcom/dropbox/core/v2/sharing/FileMemberActionResult;->invitationSignature:Ljava/util/List;

    if-eq v2, p1, :cond_6

    if-eqz v2, :cond_5

    .line 249
    invoke-interface {v2, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    :cond_7
    return v1
.end method

.method public getInvitationSignature()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 134
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult;->invitationSignature:Ljava/util/List;

    return-object v0
.end method

.method public getMember()Lcom/dropbox/core/v2/sharing/MemberSelector;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 102
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult;->member:Lcom/dropbox/core/v2/sharing/MemberSelector;

    return-object v0
.end method

.method public getResult()Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 112
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult;->result:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;

    return-object v0
.end method

.method public getSckeySha1()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 122
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult;->sckeySha1:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 6

    .line 226
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult;->member:Lcom/dropbox/core/v2/sharing/MemberSelector;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult;->result:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult;->sckeySha1:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult;->invitationSignature:Ljava/util/List;

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v0, 0x1

    aput-object v1, v4, v0

    const/4 v0, 0x2

    aput-object v2, v4, v0

    const/4 v0, 0x3

    aput-object v3, v4, v0

    invoke-static {v4}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 259
    sget-object v0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/FileMemberActionResult$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/FileMemberActionResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 271
    sget-object v0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/sharing/FileMemberActionResult$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/sharing/FileMemberActionResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
