.class Lcom/radaee/util/BookmarkHandler$2;
.super Ljava/lang/Object;
.source "BookmarkHandler.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/util/BookmarkHandler;->showBookmarks(Landroid/content/Context;Ljava/lang/String;Lcom/radaee/util/BookmarkHandler$BookmarkListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$mAdapter:Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;

.field final synthetic val$mAlertDialog:Landroid/app/AlertDialog;

.field final synthetic val$mContext:Landroid/content/Context;

.field final synthetic val$pdfPath:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/app/AlertDialog;Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 140
    iput-object p1, p0, Lcom/radaee/util/BookmarkHandler$2;->val$mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/radaee/util/BookmarkHandler$2;->val$mAlertDialog:Landroid/app/AlertDialog;

    iput-object p3, p0, Lcom/radaee/util/BookmarkHandler$2;->val$mAdapter:Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;

    iput-object p4, p0, Lcom/radaee/util/BookmarkHandler$2;->val$pdfPath:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)Z"
        }
    .end annotation

    .line 143
    iget-object v0, p0, Lcom/radaee/util/BookmarkHandler$2;->val$mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/radaee/util/BookmarkHandler$2;->val$mAlertDialog:Landroid/app/AlertDialog;

    iget-object v2, p0, Lcom/radaee/util/BookmarkHandler$2;->val$mAdapter:Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;

    iget-object v5, p0, Lcom/radaee/util/BookmarkHandler$2;->val$pdfPath:Ljava/lang/String;

    move-object v3, p2

    move v4, p3

    invoke-static/range {v0 .. v5}, Lcom/radaee/util/BookmarkHandler;->access$000(Landroid/content/Context;Landroid/app/AlertDialog;Lcom/radaee/util/BookmarkHandler$BookmarkAdapter;Landroid/view/View;ILjava/lang/String;)V

    const/4 p1, 0x1

    return p1
.end method
