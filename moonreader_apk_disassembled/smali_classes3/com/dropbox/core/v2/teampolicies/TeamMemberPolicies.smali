.class public Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;
.super Ljava/lang/Object;
.source "TeamMemberPolicies.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies$Serializer;
    }
.end annotation


# instance fields
.field protected final emmState:Lcom/dropbox/core/v2/teampolicies/EmmState;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final officeAddin:Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final sharing:Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final suggestMembersPolicy:Lcom/dropbox/core/v2/teampolicies/SuggestMembersPolicy;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;Lcom/dropbox/core/v2/teampolicies/EmmState;Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy;Lcom/dropbox/core/v2/teampolicies/SuggestMembersPolicy;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/teampolicies/EmmState;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Lcom/dropbox/core/v2/teampolicies/SuggestMembersPolicy;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_3

    .line 59
    iput-object p1, p0, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->sharing:Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;

    if-eqz p2, :cond_2

    .line 63
    iput-object p2, p0, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->emmState:Lcom/dropbox/core/v2/teampolicies/EmmState;

    if-eqz p3, :cond_1

    .line 67
    iput-object p3, p0, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->officeAddin:Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy;

    if-eqz p4, :cond_0

    .line 71
    iput-object p4, p0, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->suggestMembersPolicy:Lcom/dropbox/core/v2/teampolicies/SuggestMembersPolicy;

    return-void

    .line 69
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'suggestMembersPolicy\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 65
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'officeAddin\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 61
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'emmState\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 57
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'sharing\' is null"

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

    .line 140
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 141
    check-cast p1, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;

    .line 142
    iget-object v2, p0, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->sharing:Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;

    iget-object v3, p1, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->sharing:Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->emmState:Lcom/dropbox/core/v2/teampolicies/EmmState;

    iget-object v3, p1, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->emmState:Lcom/dropbox/core/v2/teampolicies/EmmState;

    if-eq v2, v3, :cond_3

    .line 143
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teampolicies/EmmState;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->officeAddin:Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy;

    iget-object v3, p1, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->officeAddin:Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy;

    if-eq v2, v3, :cond_4

    .line 144
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->suggestMembersPolicy:Lcom/dropbox/core/v2/teampolicies/SuggestMembersPolicy;

    iget-object p1, p1, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->suggestMembersPolicy:Lcom/dropbox/core/v2/teampolicies/SuggestMembersPolicy;

    if-eq v2, p1, :cond_6

    .line 145
    invoke-virtual {v2, p1}, Lcom/dropbox/core/v2/teampolicies/SuggestMembersPolicy;->equals(Ljava/lang/Object;)Z

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

.method public getEmmState()Lcom/dropbox/core/v2/teampolicies/EmmState;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 96
    iget-object v0, p0, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->emmState:Lcom/dropbox/core/v2/teampolicies/EmmState;

    return-object v0
.end method

.method public getOfficeAddin()Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 106
    iget-object v0, p0, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->officeAddin:Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy;

    return-object v0
.end method

.method public getSharing()Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 81
    iget-object v0, p0, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->sharing:Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;

    return-object v0
.end method

.method public getSuggestMembersPolicy()Lcom/dropbox/core/v2/teampolicies/SuggestMembersPolicy;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 117
    iget-object v0, p0, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->suggestMembersPolicy:Lcom/dropbox/core/v2/teampolicies/SuggestMembersPolicy;

    return-object v0
.end method

.method public hashCode()I
    .locals 6

    .line 122
    iget-object v0, p0, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->sharing:Lcom/dropbox/core/v2/teampolicies/TeamSharingPolicies;

    iget-object v1, p0, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->emmState:Lcom/dropbox/core/v2/teampolicies/EmmState;

    iget-object v2, p0, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->officeAddin:Lcom/dropbox/core/v2/teampolicies/OfficeAddInPolicy;

    iget-object v3, p0, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies;->suggestMembersPolicy:Lcom/dropbox/core/v2/teampolicies/SuggestMembersPolicy;

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

    .line 155
    sget-object v0, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 167
    sget-object v0, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teampolicies/TeamMemberPolicies$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
