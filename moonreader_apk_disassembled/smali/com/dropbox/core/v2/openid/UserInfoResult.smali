.class public Lcom/dropbox/core/v2/openid/UserInfoResult;
.super Ljava/lang/Object;
.source "UserInfoResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/openid/UserInfoResult$Serializer;,
        Lcom/dropbox/core/v2/openid/UserInfoResult$Builder;
    }
.end annotation


# instance fields
.field protected final email:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final emailVerified:Ljava/lang/Boolean;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final familyName:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final givenName:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final iss:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final sub:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 7

    .line 76
    const-string v5, ""

    const-string v6, ""

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/dropbox/core/v2/openid/UserInfoResult;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/Boolean;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p6    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object p1, p0, Lcom/dropbox/core/v2/openid/UserInfoResult;->familyName:Ljava/lang/String;

    .line 57
    iput-object p2, p0, Lcom/dropbox/core/v2/openid/UserInfoResult;->givenName:Ljava/lang/String;

    .line 58
    iput-object p3, p0, Lcom/dropbox/core/v2/openid/UserInfoResult;->email:Ljava/lang/String;

    .line 59
    iput-object p4, p0, Lcom/dropbox/core/v2/openid/UserInfoResult;->emailVerified:Ljava/lang/Boolean;

    if-eqz p5, :cond_1

    .line 63
    iput-object p5, p0, Lcom/dropbox/core/v2/openid/UserInfoResult;->iss:Ljava/lang/String;

    if-eqz p6, :cond_0

    .line 67
    iput-object p6, p0, Lcom/dropbox/core/v2/openid/UserInfoResult;->sub:Ljava/lang/String;

    return-void

    .line 65
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'sub\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 61
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'iss\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder()Lcom/dropbox/core/v2/openid/UserInfoResult$Builder;
    .locals 1

    .line 148
    new-instance v0, Lcom/dropbox/core/v2/openid/UserInfoResult$Builder;

    invoke-direct {v0}, Lcom/dropbox/core/v2/openid/UserInfoResult$Builder;-><init>()V

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

    .line 303
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 304
    check-cast p1, Lcom/dropbox/core/v2/openid/UserInfoResult;

    .line 305
    iget-object v2, p0, Lcom/dropbox/core/v2/openid/UserInfoResult;->familyName:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/openid/UserInfoResult;->familyName:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    if-eqz v2, :cond_7

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/openid/UserInfoResult;->givenName:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/openid/UserInfoResult;->givenName:Ljava/lang/String;

    if-eq v2, v3, :cond_3

    if-eqz v2, :cond_7

    .line 306
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/openid/UserInfoResult;->email:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/openid/UserInfoResult;->email:Ljava/lang/String;

    if-eq v2, v3, :cond_4

    if-eqz v2, :cond_7

    .line 307
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/openid/UserInfoResult;->emailVerified:Ljava/lang/Boolean;

    iget-object v3, p1, Lcom/dropbox/core/v2/openid/UserInfoResult;->emailVerified:Ljava/lang/Boolean;

    if-eq v2, v3, :cond_5

    if-eqz v2, :cond_7

    .line 308
    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_5
    iget-object v2, p0, Lcom/dropbox/core/v2/openid/UserInfoResult;->iss:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/openid/UserInfoResult;->iss:Ljava/lang/String;

    if-eq v2, v3, :cond_6

    .line 309
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_6
    iget-object v2, p0, Lcom/dropbox/core/v2/openid/UserInfoResult;->sub:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/openid/UserInfoResult;->sub:Ljava/lang/String;

    if-eq v2, p1, :cond_8

    .line 310
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_0

    :cond_7
    return v1

    :cond_8
    :goto_0
    return v0

    :cond_9
    return v1
.end method

.method public getEmail()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 106
    iget-object v0, p0, Lcom/dropbox/core/v2/openid/UserInfoResult;->email:Ljava/lang/String;

    return-object v0
.end method

.method public getEmailVerified()Ljava/lang/Boolean;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 116
    iget-object v0, p0, Lcom/dropbox/core/v2/openid/UserInfoResult;->emailVerified:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getFamilyName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 86
    iget-object v0, p0, Lcom/dropbox/core/v2/openid/UserInfoResult;->familyName:Ljava/lang/String;

    return-object v0
.end method

.method public getGivenName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 96
    iget-object v0, p0, Lcom/dropbox/core/v2/openid/UserInfoResult;->givenName:Ljava/lang/String;

    return-object v0
.end method

.method public getIss()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 127
    iget-object v0, p0, Lcom/dropbox/core/v2/openid/UserInfoResult;->iss:Ljava/lang/String;

    return-object v0
.end method

.method public getSub()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 139
    iget-object v0, p0, Lcom/dropbox/core/v2/openid/UserInfoResult;->sub:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 8

    .line 283
    iget-object v0, p0, Lcom/dropbox/core/v2/openid/UserInfoResult;->familyName:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/v2/openid/UserInfoResult;->givenName:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/openid/UserInfoResult;->email:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/openid/UserInfoResult;->emailVerified:Ljava/lang/Boolean;

    iget-object v4, p0, Lcom/dropbox/core/v2/openid/UserInfoResult;->iss:Ljava/lang/String;

    iget-object v5, p0, Lcom/dropbox/core/v2/openid/UserInfoResult;->sub:Ljava/lang/String;

    const/4 v6, 0x6

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v0, v6, v7

    const/4 v0, 0x1

    aput-object v1, v6, v0

    const/4 v0, 0x2

    aput-object v2, v6, v0

    const/4 v0, 0x3

    aput-object v3, v6, v0

    const/4 v0, 0x4

    aput-object v4, v6, v0

    const/4 v0, 0x5

    aput-object v5, v6, v0

    invoke-static {v6}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 320
    sget-object v0, Lcom/dropbox/core/v2/openid/UserInfoResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/openid/UserInfoResult$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/openid/UserInfoResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 332
    sget-object v0, Lcom/dropbox/core/v2/openid/UserInfoResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/openid/UserInfoResult$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/openid/UserInfoResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
