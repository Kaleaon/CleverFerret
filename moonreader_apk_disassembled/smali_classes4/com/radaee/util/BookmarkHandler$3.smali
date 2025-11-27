.class Lcom/radaee/util/BookmarkHandler$3;
.super Ljava/lang/Object;
.source "BookmarkHandler.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/util/BookmarkHandler;->showPopupMenu(Landroid/content/Context;Landroid/app/AlertDialog;Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;Landroid/view/View;ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$adapterView:Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;

.field final synthetic val$mAlertDialog:Landroid/app/AlertDialog;

.field final synthetic val$mContext:Landroid/content/Context;

.field final synthetic val$mPopup:Landroid/widget/PopupWindow;

.field final synthetic val$pdfPath:Ljava/lang/String;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;ILjava/lang/String;Landroid/app/AlertDialog;Landroid/content/Context;Landroid/widget/PopupWindow;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 211
    iput-object p1, p0, Lcom/radaee/util/BookmarkHandler$3;->val$adapterView:Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;

    iput p2, p0, Lcom/radaee/util/BookmarkHandler$3;->val$position:I

    iput-object p3, p0, Lcom/radaee/util/BookmarkHandler$3;->val$pdfPath:Ljava/lang/String;

    iput-object p4, p0, Lcom/radaee/util/BookmarkHandler$3;->val$mAlertDialog:Landroid/app/AlertDialog;

    iput-object p5, p0, Lcom/radaee/util/BookmarkHandler$3;->val$mContext:Landroid/content/Context;

    iput-object p6, p0, Lcom/radaee/util/BookmarkHandler$3;->val$mPopup:Landroid/widget/PopupWindow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 214
    iget-object p1, p0, Lcom/radaee/util/BookmarkHandler$3;->val$adapterView:Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;

    iget v0, p0, Lcom/radaee/util/BookmarkHandler$3;->val$position:I

    invoke-virtual {p1, v0}, Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/radaee/util/BookmarkHandler$Bookmark;

    iget-object v0, p0, Lcom/radaee/util/BookmarkHandler$3;->val$pdfPath:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/radaee/util/BookmarkHandler;->removeBookmark(Lcom/radaee/util/BookmarkHandler$Bookmark;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 215
    iget-object p1, p0, Lcom/radaee/util/BookmarkHandler$3;->val$adapterView:Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;

    iget v0, p0, Lcom/radaee/util/BookmarkHandler$3;->val$position:I

    invoke-virtual {p1, v0}, Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;->removeItem(I)V

    .line 216
    iget-object p1, p0, Lcom/radaee/util/BookmarkHandler$3;->val$adapterView:Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;

    invoke-virtual {p1}, Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;->notifyDataSetChanged()V

    .line 217
    iget-object p1, p0, Lcom/radaee/util/BookmarkHandler$3;->val$adapterView:Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;

    invoke-virtual {p1}, Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;->getCount()I

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/radaee/util/BookmarkHandler$3;->val$mAlertDialog:Landroid/app/AlertDialog;

    if-eqz p1, :cond_1

    .line 218
    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    goto :goto_0

    .line 220
    :cond_0
    iget-object p1, p0, Lcom/radaee/util/BookmarkHandler$3;->val$mContext:Landroid/content/Context;

    sget v0, Lcom/radaee/viewlib/R$string;->bookmark_remove_error:I

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 221
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/radaee/util/BookmarkHandler$3;->val$mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {p1}, Landroid/widget/PopupWindow;->dismiss()V

    return-void
.end method
