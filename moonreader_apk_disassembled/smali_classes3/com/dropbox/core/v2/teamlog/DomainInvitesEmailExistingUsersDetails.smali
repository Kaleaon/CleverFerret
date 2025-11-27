.class public Lcom/dropbox/core/v2/teamlog/DomainInvitesEmailExistingUsersDetails;
.super Ljava/lang/Object;
.source "DomainInvitesEmailExistingUsersDetails.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/DomainInvitesEmailExistingUsersDetails$Serializer;
    }
.end annotation


# instance fields
.field protected final domainName:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final numRecipients:J


# direct methods
.method public constructor <init>(Ljava/lang/String;J)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 44
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/DomainInvitesEmailExistingUsersDetails;->domainName:Ljava/lang/String;

    .line 45
    iput-wide p2, p0, Lcom/dropbox/core/v2/teamlog/DomainInvitesEmailExistingUsersDetails;->numRecipients:J

    return-void

    .line 42
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'domainName\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 85
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 86
    check-cast p1, Lcom/dropbox/core/v2/teamlog/DomainInvitesEmailExistingUsersDetails;

    .line 87
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/DomainInvitesEmailExistingUsersDetails;->domainName:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/DomainInvitesEmailExistingUsersDetails;->domainName:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    iget-wide v2, p0, Lcom/dropbox/core/v2/teamlog/DomainInvitesEmailExistingUsersDetails;->numRecipients:J

    iget-wide v4, p1, Lcom/dropbox/core/v2/teamlog/DomainInvitesEmailExistingUsersDetails;->numRecipients:J

    cmp-long p1, v2, v4

    if-nez p1, :cond_3

    return v0

    :cond_3
    return v1
.end method

.method public getDomainName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 55
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/DomainInvitesEmailExistingUsersDetails;->domainName:Ljava/lang/String;

    return-object v0
.end method

.method public getNumRecipients()J
    .locals 2

    .line 64
    iget-wide v0, p0, Lcom/dropbox/core/v2/teamlog/DomainInvitesEmailExistingUsersDetails;->numRecipients:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 4

    .line 69
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/DomainInvitesEmailExistingUsersDetails;->domainName:Ljava/lang/String;

    iget-wide v1, p0, Lcom/dropbox/core/v2/teamlog/DomainInvitesEmailExistingUsersDetails;->numRecipients:J

    .line 71
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    .line 69
    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 98
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DomainInvitesEmailExistingUsersDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/DomainInvitesEmailExistingUsersDetails$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/DomainInvitesEmailExistingUsersDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 110
    sget-object v0, Lcom/dropbox/core/v2/teamlog/DomainInvitesEmailExistingUsersDetails$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/DomainInvitesEmailExistingUsersDetails$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/DomainInvitesEmailExistingUsersDetails$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
