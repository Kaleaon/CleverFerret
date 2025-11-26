.class Lcom/radaee/util/BookmarkHandler$1;
.super Ljava/lang/Object;
.source "BookmarkHandler.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/util/BookmarkHandler;->showBookmarks(Landroid/content/Context;Ljava/lang/String;Lcom/radaee/util/BookmarkHandler$BookmarkListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$bookmarkListener:Lcom/radaee/util/BookmarkHandler$BookmarkListener;

.field final synthetic val$mAlertDialog:Landroid/app/AlertDialog;


# direct methods
.method constructor <init>(Lcom/radaee/util/BookmarkHandler$BookmarkListener;Landroid/app/AlertDialog;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 131
    iput-object p1, p0, Lcom/radaee/util/BookmarkHandler$1;->val$bookmarkListener:Lcom/radaee/util/BookmarkHandler$BookmarkListener;

    iput-object p2, p0, Lcom/radaee/util/BookmarkHandler$1;->val$mAlertDialog:Landroid/app/AlertDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 134
    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/radaee/util/BookmarkHandler$Bookmark;

    if-eqz p1, :cond_0

    .line 135
    iget-object p2, p0, Lcom/radaee/util/BookmarkHandler$1;->val$bookmarkListener:Lcom/radaee/util/BookmarkHandler$BookmarkListener;

    if-eqz p2, :cond_0

    .line 136
    iget p1, p1, Lcom/radaee/util/BookmarkHandler$Bookmark;->page:I

    invoke-interface {p2, p1}, Lcom/radaee/util/BookmarkHandler$BookmarkListener;->onBookmarkClickedListener(I)V

    .line 137
    :cond_0
    iget-object p1, p0, Lcom/radaee/util/BookmarkHandler$1;->val$mAlertDialog:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    return-void
.end method
