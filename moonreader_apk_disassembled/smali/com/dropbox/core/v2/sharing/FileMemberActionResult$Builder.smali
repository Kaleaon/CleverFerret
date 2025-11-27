.class public Lcom/dropbox/core/v2/sharing/FileMemberActionResult$Builder;
.super Ljava/lang/Object;
.source "FileMemberActionResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/sharing/FileMemberActionResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected invitationSignature:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected final member:Lcom/dropbox/core/v2/sharing/MemberSelector;

.field protected final result:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;

.field protected sckeySha1:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Lcom/dropbox/core/v2/sharing/MemberSelector;Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;)V
    .locals 0

    .line 163
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 167
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult$Builder;->member:Lcom/dropbox/core/v2/sharing/MemberSelector;

    if-eqz p2, :cond_0

    .line 171
    iput-object p2, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult$Builder;->result:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;

    const/4 p1, 0x0

    .line 172
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult$Builder;->sckeySha1:Ljava/lang/String;

    .line 173
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult$Builder;->invitationSignature:Ljava/util/List;

    return-void

    .line 169
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'result\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 165
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'member\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/sharing/FileMemberActionResult;
    .locals 5

    .line 220
    new-instance v0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult$Builder;->member:Lcom/dropbox/core/v2/sharing/MemberSelector;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult$Builder;->result:Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult$Builder;->sckeySha1:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult$Builder;->invitationSignature:Ljava/util/List;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/dropbox/core/v2/sharing/FileMemberActionResult;-><init>(Lcom/dropbox/core/v2/sharing/MemberSelector;Lcom/dropbox/core/v2/sharing/FileMemberActionIndividualResult;Ljava/lang/String;Ljava/util/List;)V

    return-object v0
.end method

.method public withInvitationSignature(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/FileMemberActionResult$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/sharing/FileMemberActionResult$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 203
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 205
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'invitationSignature\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 209
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult$Builder;->invitationSignature:Ljava/util/List;

    return-object p0
.end method

.method public withSckeySha1(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/FileMemberActionResult$Builder;
    .locals 0

    .line 184
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/FileMemberActionResult$Builder;->sckeySha1:Ljava/lang/String;

    return-object p0
.end method
