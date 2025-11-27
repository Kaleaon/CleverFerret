.class public Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;
.super Ljava/lang/Object;
.source "AddPaperDocUser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/paper/AddPaperDocUser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected customMessage:Ljava/lang/String;

.field protected final docId:Ljava/lang/String;

.field protected final members:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/paper/AddMember;",
            ">;"
        }
    .end annotation
.end field

.field protected quiet:Z


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/paper/AddMember;",
            ">;)V"
        }
    .end annotation

    .line 153
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_4

    .line 157
    iput-object p1, p0, Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;->docId:Ljava/lang/String;

    if-eqz p2, :cond_3

    .line 161
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p1

    const/16 v0, 0x14

    if-gt p1, v0, :cond_2

    .line 164
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dropbox/core/v2/paper/AddMember;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 166
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'members\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 169
    :cond_1
    iput-object p2, p0, Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;->members:Ljava/util/List;

    const/4 p1, 0x0

    .line 170
    iput-object p1, p0, Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;->customMessage:Ljava/lang/String;

    const/4 p1, 0x0

    .line 171
    iput-boolean p1, p0, Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;->quiet:Z

    return-void

    .line 162
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "List \'members\' has more than 20 items"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 159
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'members\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 155
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'docId\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/paper/AddPaperDocUser;
    .locals 5

    .line 216
    new-instance v0, Lcom/dropbox/core/v2/paper/AddPaperDocUser;

    iget-object v1, p0, Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;->docId:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;->members:Ljava/util/List;

    iget-object v3, p0, Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;->customMessage:Ljava/lang/String;

    iget-boolean v4, p0, Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;->quiet:Z

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/dropbox/core/v2/paper/AddPaperDocUser;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Z)V

    return-object v0
.end method

.method public withCustomMessage(Ljava/lang/String;)Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;
    .locals 0

    .line 183
    iput-object p1, p0, Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;->customMessage:Ljava/lang/String;

    return-object p0
.end method

.method public withQuiet(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 201
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;->quiet:Z

    return-object p0

    :cond_0
    const/4 p1, 0x0

    .line 204
    iput-boolean p1, p0, Lcom/dropbox/core/v2/paper/AddPaperDocUser$Builder;->quiet:Z

    return-object p0
.end method
