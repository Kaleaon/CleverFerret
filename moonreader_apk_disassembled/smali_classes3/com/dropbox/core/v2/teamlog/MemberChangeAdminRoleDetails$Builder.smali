.class public Lcom/dropbox/core/v2/teamlog/MemberChangeAdminRoleDetails$Builder;
.super Ljava/lang/Object;
.source "MemberChangeAdminRoleDetails.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/MemberChangeAdminRoleDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected newValue:Lcom/dropbox/core/v2/teamlog/AdminRole;

.field protected previousValue:Lcom/dropbox/core/v2/teamlog/AdminRole;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 99
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeAdminRoleDetails$Builder;->newValue:Lcom/dropbox/core/v2/teamlog/AdminRole;

    .line 100
    iput-object v0, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeAdminRoleDetails$Builder;->previousValue:Lcom/dropbox/core/v2/teamlog/AdminRole;

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/MemberChangeAdminRoleDetails;
    .locals 3

    .line 137
    new-instance v0, Lcom/dropbox/core/v2/teamlog/MemberChangeAdminRoleDetails;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeAdminRoleDetails$Builder;->newValue:Lcom/dropbox/core/v2/teamlog/AdminRole;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeAdminRoleDetails$Builder;->previousValue:Lcom/dropbox/core/v2/teamlog/AdminRole;

    invoke-direct {v0, v1, v2}, Lcom/dropbox/core/v2/teamlog/MemberChangeAdminRoleDetails;-><init>(Lcom/dropbox/core/v2/teamlog/AdminRole;Lcom/dropbox/core/v2/teamlog/AdminRole;)V

    return-object v0
.end method

.method public withNewValue(Lcom/dropbox/core/v2/teamlog/AdminRole;)Lcom/dropbox/core/v2/teamlog/MemberChangeAdminRoleDetails$Builder;
    .locals 0

    .line 113
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeAdminRoleDetails$Builder;->newValue:Lcom/dropbox/core/v2/teamlog/AdminRole;

    return-object p0
.end method

.method public withPreviousValue(Lcom/dropbox/core/v2/teamlog/AdminRole;)Lcom/dropbox/core/v2/teamlog/MemberChangeAdminRoleDetails$Builder;
    .locals 0

    .line 126
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/MemberChangeAdminRoleDetails$Builder;->previousValue:Lcom/dropbox/core/v2/teamlog/AdminRole;

    return-object p0
.end method
