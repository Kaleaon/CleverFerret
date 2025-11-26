.class public Lcom/dropbox/core/v2/team/SharingAllowlistListResponse$Builder;
.super Ljava/lang/Object;
.source "SharingAllowlistListResponse.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/team/SharingAllowlistListResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected cursor:Ljava/lang/String;

.field protected final domains:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected final emails:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected hasMore:Z


# direct methods
.method protected constructor <init>(Ljava/util/List;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 170
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_5

    .line 174
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

    .line 176
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'domains\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 179
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/team/SharingAllowlistListResponse$Builder;->domains:Ljava/util/List;

    if-eqz p2, :cond_4

    .line 183
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_2

    goto :goto_1

    .line 185
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'emails\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 188
    :cond_3
    iput-object p2, p0, Lcom/dropbox/core/v2/team/SharingAllowlistListResponse$Builder;->emails:Ljava/util/List;

    .line 189
    const-string p1, ""

    iput-object p1, p0, Lcom/dropbox/core/v2/team/SharingAllowlistListResponse$Builder;->cursor:Ljava/lang/String;

    const/4 p1, 0x0

    .line 190
    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/SharingAllowlistListResponse$Builder;->hasMore:Z

    return-void

    .line 181
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'emails\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 172
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'domains\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/team/SharingAllowlistListResponse;
    .locals 5

    .line 250
    new-instance v0, Lcom/dropbox/core/v2/team/SharingAllowlistListResponse;

    iget-object v1, p0, Lcom/dropbox/core/v2/team/SharingAllowlistListResponse$Builder;->domains:Ljava/util/List;

    iget-object v2, p0, Lcom/dropbox/core/v2/team/SharingAllowlistListResponse$Builder;->emails:Ljava/util/List;

    iget-object v3, p0, Lcom/dropbox/core/v2/team/SharingAllowlistListResponse$Builder;->cursor:Ljava/lang/String;

    iget-boolean v4, p0, Lcom/dropbox/core/v2/team/SharingAllowlistListResponse$Builder;->hasMore:Z

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/dropbox/core/v2/team/SharingAllowlistListResponse;-><init>(Ljava/util/List;Ljava/util/List;Ljava/lang/String;Z)V

    return-object v0
.end method

.method public withCursor(Ljava/lang/String;)Lcom/dropbox/core/v2/team/SharingAllowlistListResponse$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 212
    iput-object p1, p0, Lcom/dropbox/core/v2/team/SharingAllowlistListResponse$Builder;->cursor:Ljava/lang/String;

    return-object p0

    .line 215
    :cond_0
    const-string p1, ""

    iput-object p1, p0, Lcom/dropbox/core/v2/team/SharingAllowlistListResponse$Builder;->cursor:Ljava/lang/String;

    return-object p0
.end method

.method public withHasMore(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/team/SharingAllowlistListResponse$Builder;
    .locals 0

    if-eqz p1, :cond_0

    .line 235
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/SharingAllowlistListResponse$Builder;->hasMore:Z

    return-object p0

    :cond_0
    const/4 p1, 0x0

    .line 238
    iput-boolean p1, p0, Lcom/dropbox/core/v2/team/SharingAllowlistListResponse$Builder;->hasMore:Z

    return-object p0
.end method
