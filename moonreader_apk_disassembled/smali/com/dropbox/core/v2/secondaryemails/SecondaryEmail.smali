.class public Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;
.super Ljava/lang/Object;
.source "SecondaryEmail.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail$Serializer;
    }
.end annotation


# instance fields
.field protected final email:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final isVerified:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_2

    .line 45
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_1

    .line 48
    const-string v0, "^[\'#&A-Za-z0-9._%+-]+@[A-Za-z0-9-][A-Za-z0-9.-]*\\.[A-Za-z]{2,15}$"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 51
    iput-object p1, p0, Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;->email:Ljava/lang/String;

    .line 52
    iput-boolean p2, p0, Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;->isVerified:Z

    return-void

    .line 49
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'email\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 46
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'email\' is longer than 255"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 43
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'email\' is null"

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

    .line 93
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 94
    check-cast p1, Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;

    .line 95
    iget-object v2, p0, Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;->email:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;->email:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    iget-boolean v2, p0, Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;->isVerified:Z

    iget-boolean p1, p1, Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;->isVerified:Z

    if-ne v2, p1, :cond_3

    return v0

    :cond_3
    return v1
.end method

.method public getEmail()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 62
    iget-object v0, p0, Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;->email:Ljava/lang/String;

    return-object v0
.end method

.method public getIsVerified()Z
    .locals 1

    .line 72
    iget-boolean v0, p0, Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;->isVerified:Z

    return v0
.end method

.method public hashCode()I
    .locals 4

    .line 77
    iget-object v0, p0, Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;->email:Ljava/lang/String;

    iget-boolean v1, p0, Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail;->isVerified:Z

    .line 79
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    .line 77
    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 106
    sget-object v0, Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail$Serializer;->INSTANCE:Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 118
    sget-object v0, Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail$Serializer;->INSTANCE:Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/secondaryemails/SecondaryEmail$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
