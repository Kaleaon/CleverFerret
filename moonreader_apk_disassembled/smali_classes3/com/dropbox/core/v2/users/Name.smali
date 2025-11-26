.class public Lcom/dropbox/core/v2/users/Name;
.super Ljava/lang/Object;
.source "Name.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/users/Name$Serializer;
    }
.end annotation


# instance fields
.field protected final abbreviatedName:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final displayName:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final familiarName:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final givenName:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final surname:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_4

    .line 60
    iput-object p1, p0, Lcom/dropbox/core/v2/users/Name;->givenName:Ljava/lang/String;

    if-eqz p2, :cond_3

    .line 64
    iput-object p2, p0, Lcom/dropbox/core/v2/users/Name;->surname:Ljava/lang/String;

    if-eqz p3, :cond_2

    .line 68
    iput-object p3, p0, Lcom/dropbox/core/v2/users/Name;->familiarName:Ljava/lang/String;

    if-eqz p4, :cond_1

    .line 72
    iput-object p4, p0, Lcom/dropbox/core/v2/users/Name;->displayName:Ljava/lang/String;

    if-eqz p5, :cond_0

    .line 76
    iput-object p5, p0, Lcom/dropbox/core/v2/users/Name;->abbreviatedName:Ljava/lang/String;

    return-void

    .line 74
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'abbreviatedName\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 70
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'displayName\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 66
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'familiarName\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 62
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'surname\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 58
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'givenName\' is null"

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

    .line 153
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 154
    check-cast p1, Lcom/dropbox/core/v2/users/Name;

    .line 155
    iget-object v2, p0, Lcom/dropbox/core/v2/users/Name;->givenName:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/Name;->givenName:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/users/Name;->surname:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/Name;->surname:Ljava/lang/String;

    if-eq v2, v3, :cond_3

    .line 156
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/users/Name;->familiarName:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/Name;->familiarName:Ljava/lang/String;

    if-eq v2, v3, :cond_4

    .line 157
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/users/Name;->displayName:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/Name;->displayName:Ljava/lang/String;

    if-eq v2, v3, :cond_5

    .line 158
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_5
    iget-object v2, p0, Lcom/dropbox/core/v2/users/Name;->abbreviatedName:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/users/Name;->abbreviatedName:Ljava/lang/String;

    if-eq v2, p1, :cond_7

    .line 159
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    goto :goto_0

    :cond_6
    return v1

    :cond_7
    :goto_0
    return v0

    :cond_8
    return v1
.end method

.method public getAbbreviatedName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 129
    iget-object v0, p0, Lcom/dropbox/core/v2/users/Name;->abbreviatedName:Ljava/lang/String;

    return-object v0
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 119
    iget-object v0, p0, Lcom/dropbox/core/v2/users/Name;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getFamiliarName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 108
    iget-object v0, p0, Lcom/dropbox/core/v2/users/Name;->familiarName:Ljava/lang/String;

    return-object v0
.end method

.method public getGivenName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 86
    iget-object v0, p0, Lcom/dropbox/core/v2/users/Name;->givenName:Ljava/lang/String;

    return-object v0
.end method

.method public getSurname()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 96
    iget-object v0, p0, Lcom/dropbox/core/v2/users/Name;->surname:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 7

    .line 134
    iget-object v0, p0, Lcom/dropbox/core/v2/users/Name;->givenName:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/v2/users/Name;->surname:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/users/Name;->familiarName:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/users/Name;->displayName:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/users/Name;->abbreviatedName:Ljava/lang/String;

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

.method public toString()Ljava/lang/String;
    .locals 2

    .line 169
    sget-object v0, Lcom/dropbox/core/v2/users/Name$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/Name$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/users/Name$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 181
    sget-object v0, Lcom/dropbox/core/v2/users/Name$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/Name$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/users/Name$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
