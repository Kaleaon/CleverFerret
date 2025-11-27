.class public Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;
.super Landroid/widget/BaseAdapter;
.source "BookmarkHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/radaee/util/BookmarkHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BookmarkAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/radaee/util/BookmarkHandler$BookmarkAdapter$ViewHolder;
    }
.end annotation


# instance fields
.field mBookmarks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/radaee/util/BookmarkHandler$Bookmark;",
            ">;"
        }
    .end annotation
.end field

.field mContext:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/radaee/util/BookmarkHandler$Bookmark;",
            ">;)V"
        }
    .end annotation

    .line 235
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 236
    iput-object p1, p0, Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;->mContext:Landroid/content/Context;

    .line 237
    iput-object p2, p0, Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;->mBookmarks:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 242
    iget-object v0, p0, Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;->mBookmarks:Ljava/util/List;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    .line 247
    iget-object v0, p0, Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;->mBookmarks:Ljava/util/List;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    .line 253
    iget-object v0, p0, Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;->mBookmarks:Ljava/util/List;

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;->mBookmarks:Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    int-to-long v0, p1

    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    if-nez p2, :cond_0

    .line 261
    iget-object p2, p0, Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;->mContext:Landroid/content/Context;

    const-string v0, "layout_inflater"

    invoke-virtual {p2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/LayoutInflater;

    sget v0, Lcom/radaee/viewlib/R$layout;->bookmark_row:I

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 263
    new-instance p3, Lcom/radaee/util/BookmarkHandler$BookmarkAdapter$ViewHolder;

    const/4 v0, 0x0

    invoke-direct {p3, p0, v0}, Lcom/radaee/util/BookmarkHandler$BookmarkAdapter$ViewHolder;-><init>(Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;Lcom/radaee/util/BookmarkHandler$1;)V

    .line 264
    sget v0, Lcom/radaee/viewlib/R$id;->label:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p3, Lcom/radaee/util/BookmarkHandler$BookmarkAdapter$ViewHolder;->label:Landroid/widget/TextView;

    .line 265
    invoke-virtual {p2, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_0

    .line 267
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/radaee/util/BookmarkHandler$BookmarkAdapter$ViewHolder;

    .line 269
    :goto_0
    invoke-virtual {p0, p1}, Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/radaee/util/BookmarkHandler$Bookmark;

    .line 271
    iget-object p3, p3, Lcom/radaee/util/BookmarkHandler$BookmarkAdapter$ViewHolder;->label:Landroid/widget/TextView;

    iget-object p1, p1, Lcom/radaee/util/BookmarkHandler$Bookmark;->bmLabel:Ljava/lang/String;

    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object p2
.end method

.method removeItem(I)V
    .locals 1

    .line 277
    iget-object v0, p0, Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;->mBookmarks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    return-void
.end method
