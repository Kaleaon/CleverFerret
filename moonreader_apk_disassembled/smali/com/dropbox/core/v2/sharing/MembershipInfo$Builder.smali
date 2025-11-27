.class public Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;
.super Ljava/lang/Object;
.source "MembershipInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/sharing/MembershipInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected final accessType:Lcom/dropbox/core/v2/sharing/AccessLevel;

.field protected initials:Ljava/lang/String;

.field protected isInherited:Z

.field protected permissions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/MemberPermission;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lcom/dropbox/core/v2/sharing/AccessLevel;)V
    .locals 1

    .line 156
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 160
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;->accessType:Lcom/dropbox/core/v2/sharing/AccessLevel;

    const/4 p1, 0x0

    .line 161
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;->permissions:Ljava/util/List;

    .line 162
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;->initials:Ljava/lang/String;

    const/4 p1, 0x0

    .line 163
    iput-boolean p1, p0, Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;->isInherited:Z

    return-void

    .line 158
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'accessType\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/sharing/MembershipInfo;
    .locals 5

    .line 230
    new-instance v0, Lcom/dropbox/core/v2/sharing/MembershipInfo;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;->accessType:Lcom/dropbox/core/v2/sharing/AccessLevel;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;->permissions:Ljava/util/List;

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;->initials:Ljava/lang/String;

    iget-boolean v4, p0, Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;->isInherited:Z

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/dropbox/core/v2/sharing/MembershipInfo;-><init>(Lcom/dropbox/core/v2/sharing/AccessLevel;Ljava/util/List;Ljava/lang/String;Z)V

    return-object v0
.end method

.method public withInitials(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;
    .locals 0

    .line 198
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;->initials:Ljava/lang/String;

    return-object p0
.end method

.method public withIsInherited(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 215
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;->isInherited:Z

    return-object p0

    :cond_0
    const/4 p1, 0x0

    .line 218
    iput-boolean p1, p0, Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;->isInherited:Z

    return-object p0
.end method

.method public withPermissions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/MemberPermission;",
            ">;)",
            "Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 180
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dropbox/core/v2/sharing/MemberPermission;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 182
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'permissions\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 186
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/MembershipInfo$Builder;->permissions:Ljava/util/List;

    return-object p0
.end method
