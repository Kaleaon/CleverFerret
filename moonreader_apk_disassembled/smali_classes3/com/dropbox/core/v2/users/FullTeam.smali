.class public Lcom/dropbox/core/v2/users/FullTeam;
.super Lcom/dropbox/core/v2/users/Team;
.source "FullTeam.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/users/FullTeam$Serializer;
    }
.end annotation


# instance fields
.field protected final officeAddinPolicy:Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final sharingPolicies:Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 48
    invoke-direct {p0, p1, p2}, Lcom/dropbox/core/v2/users/Team;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p3, :cond_1

    .line 52
    iput-object p3, p0, Lcom/dropbox/core/v2/users/FullTeam;->sharingPolicies:Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;

    if-eqz p4, :cond_0

    .line 56
    iput-object p4, p0, Lcom/dropbox/core/v2/users/FullTeam;->officeAddinPolicy:Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy;

    return-void

    .line 54
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'officeAddinPolicy\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 50
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'sharingPolicies\' is null"

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

    .line 118
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 119
    check-cast p1, Lcom/dropbox/core/v2/users/FullTeam;

    .line 120
    iget-object v2, p0, Lcom/dropbox/core/v2/users/FullTeam;->id:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/FullTeam;->id:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    iget-object v2, p0, Lcom/dropbox/core/v2/users/FullTeam;->id:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/FullTeam;->id:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/users/FullTeam;->name:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/FullTeam;->name:Ljava/lang/String;

    if-eq v2, v3, :cond_3

    iget-object v2, p0, Lcom/dropbox/core/v2/users/FullTeam;->name:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/FullTeam;->name:Ljava/lang/String;

    .line 121
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/users/FullTeam;->sharingPolicies:Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;

    iget-object v3, p1, Lcom/dropbox/core/v2/users/FullTeam;->sharingPolicies:Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;

    if-eq v2, v3, :cond_4

    .line 122
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/users/FullTeam;->officeAddinPolicy:Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy;

    iget-object p1, p1, Lcom/dropbox/core/v2/users/FullTeam;->officeAddinPolicy:Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy;

    if-eq v2, p1, :cond_6

    .line 123
    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy;->equals(Ljava/lang/Object;)Z

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

.method public getId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 66
    iget-object v0, p0, Lcom/dropbox/core/v2/users/FullTeam;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 76
    iget-object v0, p0, Lcom/dropbox/core/v2/users/FullTeam;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getOfficeAddinPolicy()Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 96
    iget-object v0, p0, Lcom/dropbox/core/v2/users/FullTeam;->officeAddinPolicy:Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy;

    return-object v0
.end method

.method public getSharingPolicies()Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 86
    iget-object v0, p0, Lcom/dropbox/core/v2/users/FullTeam;->sharingPolicies:Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 101
    iget-object v0, p0, Lcom/dropbox/core/v2/users/FullTeam;->sharingPolicies:Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;

    iget-object v1, p0, Lcom/dropbox/core/v2/users/FullTeam;->officeAddinPolicy:Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    .line 105
    invoke-super {p0}, Lcom/dropbox/core/v2/users/Team;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 133
    sget-object v0, Lcom/dropbox/core/v2/users/FullTeam$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/FullTeam$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/users/FullTeam$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 145
    sget-object v0, Lcom/dropbox/core/v2/users/FullTeam$Serializer;->INSTANCE:Lcom/dropbox/core/v2/users/FullTeam$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/users/FullTeam$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
