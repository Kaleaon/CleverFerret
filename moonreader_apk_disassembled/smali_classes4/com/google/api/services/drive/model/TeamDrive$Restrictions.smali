.class public final Lcom/google/api/services/drive/model/TeamDrive$Restrictions;
.super Lcom/google/api/client/json/GenericJson;
.source "TeamDrive.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/api/services/drive/model/TeamDrive;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Restrictions"
.end annotation


# instance fields
.field private adminManagedRestrictions:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private copyRequiresWriterPermission:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private domainUsersOnly:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private teamMembersOnly:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 934
    invoke-direct {p0}, Lcom/google/api/client/json/GenericJson;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic clone()Lcom/google/api/client/json/GenericJson;
    .locals 1

    .line 934
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/TeamDrive$Restrictions;->clone()Lcom/google/api/services/drive/model/TeamDrive$Restrictions;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/google/api/client/util/GenericData;
    .locals 1

    .line 934
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/TeamDrive$Restrictions;->clone()Lcom/google/api/services/drive/model/TeamDrive$Restrictions;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/google/api/services/drive/model/TeamDrive$Restrictions;
    .locals 1

    .line 1051
    invoke-super {p0}, Lcom/google/api/client/json/GenericJson;->clone()Lcom/google/api/client/json/GenericJson;

    move-result-object v0

    check-cast v0, Lcom/google/api/services/drive/model/TeamDrive$Restrictions;

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 934
    invoke-virtual {p0}, Lcom/google/api/services/drive/model/TeamDrive$Restrictions;->clone()Lcom/google/api/services/drive/model/TeamDrive$Restrictions;

    move-result-object v0

    return-object v0
.end method

.method public getAdminManagedRestrictions()Ljava/lang/Boolean;
    .locals 1

    .line 973
    iget-object v0, p0, Lcom/google/api/services/drive/model/TeamDrive$Restrictions;->adminManagedRestrictions:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCopyRequiresWriterPermission()Ljava/lang/Boolean;
    .locals 1

    .line 992
    iget-object v0, p0, Lcom/google/api/services/drive/model/TeamDrive$Restrictions;->copyRequiresWriterPermission:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getDomainUsersOnly()Ljava/lang/Boolean;
    .locals 1

    .line 1013
    iget-object v0, p0, Lcom/google/api/services/drive/model/TeamDrive$Restrictions;->domainUsersOnly:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getTeamMembersOnly()Ljava/lang/Boolean;
    .locals 1

    .line 1032
    iget-object v0, p0, Lcom/google/api/services/drive/model/TeamDrive$Restrictions;->teamMembersOnly:Ljava/lang/Boolean;

    return-object v0
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/json/GenericJson;
    .locals 0

    .line 934
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/model/TeamDrive$Restrictions;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/TeamDrive$Restrictions;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/util/GenericData;
    .locals 0

    .line 934
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/model/TeamDrive$Restrictions;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/TeamDrive$Restrictions;

    move-result-object p1

    return-object p1
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/model/TeamDrive$Restrictions;
    .locals 0

    .line 1046
    invoke-super {p0, p1, p2}, Lcom/google/api/client/json/GenericJson;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/json/GenericJson;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/model/TeamDrive$Restrictions;

    return-object p1
.end method

.method public setAdminManagedRestrictions(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/TeamDrive$Restrictions;
    .locals 0

    .line 981
    iput-object p1, p0, Lcom/google/api/services/drive/model/TeamDrive$Restrictions;->adminManagedRestrictions:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setCopyRequiresWriterPermission(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/TeamDrive$Restrictions;
    .locals 0

    .line 1002
    iput-object p1, p0, Lcom/google/api/services/drive/model/TeamDrive$Restrictions;->copyRequiresWriterPermission:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setDomainUsersOnly(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/TeamDrive$Restrictions;
    .locals 0

    .line 1023
    iput-object p1, p0, Lcom/google/api/services/drive/model/TeamDrive$Restrictions;->domainUsersOnly:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setTeamMembersOnly(Ljava/lang/Boolean;)Lcom/google/api/services/drive/model/TeamDrive$Restrictions;
    .locals 0

    .line 1040
    iput-object p1, p0, Lcom/google/api/services/drive/model/TeamDrive$Restrictions;->teamMembersOnly:Ljava/lang/Boolean;

    return-object p0
.end method
