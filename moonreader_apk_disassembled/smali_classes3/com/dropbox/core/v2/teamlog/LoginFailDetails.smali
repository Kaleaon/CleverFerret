.class public Lcom/dropbox/core/v2/teamlog/LoginFailDetails;
.super Ljava/lang/Object;
.source "LoginFailDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/LoginFailDetails$Serializer;
    }
.end annotation


# instance fields
.field protected final errorDetails:Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final isEmmManaged:Ljava/lang/Boolean;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final loginMethod:Lcom/dropbox/core/v2/teamlog/LoginMethod;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/teamlog/LoginMethod;Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo;)V
    .locals 1
    .param p1    # Lcom/dropbox/core/v2/teamlog/LoginMethod;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 70
    invoke-direct {p0, p1, p2, v0}, Lcom/dropbox/core/v2/teamlog/LoginFailDetails;-><init>(Lcom/dropbox/core/v2/teamlog/LoginMethod;Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo;Ljava/lang/Boolean;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/v2/teamlog/LoginMethod;Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo;Ljava/lang/Boolean;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/teamlog/LoginMethod;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/Boolean;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/LoginFailDetails;->isEmmManaged:Ljava/lang/Boolean;

    if-eqz p1, :cond_1

    .line 51
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/LoginFailDetails;->loginMethod:Lcom/dropbox/core/v2/teamlog/LoginMethod;

    if-eqz p2, :cond_0

    .line 55
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/LoginFailDetails;->errorDetails:Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo;

    return-void

    .line 53
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'errorDetails\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 49
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'loginMethod\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
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

    .line 123
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 124
    check-cast p1, Lcom/dropbox/core/v2/teamlog/LoginFailDetails;

    .line 125
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LoginFailDetails;->loginMethod:Lcom/dropbox/core/v2/teamlog/LoginMethod;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/LoginFailDetails;->loginMethod:Lcom/dropbox/core/v2/teamlog/LoginMethod;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/LoginMethod;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LoginFailDetails;->errorDetails:Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/LoginFailDetails;->errorDetails:Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo;

    if-eq v2, v3, :cond_3

    .line 126
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LoginFailDetails;->isEmmManaged:Ljava/lang/Boolean;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/LoginFailDetails;->isEmmManaged:Ljava/lang/Boolean;

    if-eq v2, p1, :cond_5

    if-eqz v2, :cond_4

    .line 127
    invoke-virtual {v2, p1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    return v1

    :cond_5
    :goto_0
    return v0

    :cond_6
    return v1
.end method

.method public getErrorDetails()Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 90
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LoginFailDetails;->errorDetails:Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo;

    return-object v0
.end method

.method public getIsEmmManaged()Ljava/lang/Boolean;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 101
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LoginFailDetails;->isEmmManaged:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getLoginMethod()Lcom/dropbox/core/v2/teamlog/LoginMethod;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 80
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LoginFailDetails;->loginMethod:Lcom/dropbox/core/v2/teamlog/LoginMethod;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .line 106
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/LoginFailDetails;->isEmmManaged:Ljava/lang/Boolean;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/LoginFailDetails;->loginMethod:Lcom/dropbox/core/v2/teamlog/LoginMethod;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/LoginFailDetails;->errorDetails:Lcom/dropbox/core/v2/teamlog/FailureDetailsLogInfo;

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

.method public toString()Ljava/lang/String;
    .locals 2

    .line 137
    sget-object v0, Lcom/dropbox/core/v2/teamlog/LoginFailDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/LoginFailDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/LoginFailDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 149
    sget-object v0, Lcom/dropbox/core/v2/teamlog/LoginFailDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/LoginFailDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/LoginFailDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
