.class Lcom/radaee/util/CommonUtil$1;
.super Ljava/lang/Object;
.source "CommonUtil.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/util/CommonUtil;->showPDFOutlines(Lcom/radaee/view/ILayoutView;Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$mAlertDialog:Landroid/app/AlertDialog;

.field final synthetic val$mOutlineList:Lcom/radaee/util/OutlineList;

.field final synthetic val$mPdfLayoutView:Lcom/radaee/view/ILayoutView;


# direct methods
.method constructor <init>(Lcom/radaee/util/OutlineList;Lcom/radaee/view/ILayoutView;Landroid/app/AlertDialog;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 295
    iput-object p1, p0, Lcom/radaee/util/CommonUtil$1;->val$mOutlineList:Lcom/radaee/util/OutlineList;

    iput-object p2, p0, Lcom/radaee/util/CommonUtil$1;->val$mPdfLayoutView:Lcom/radaee/view/ILayoutView;

    iput-object p3, p0, Lcom/radaee/util/CommonUtil$1;->val$mAlertDialog:Landroid/app/AlertDialog;

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

    .line 298
    iget-object p1, p0, Lcom/radaee/util/CommonUtil$1;->val$mOutlineList:Lcom/radaee/util/OutlineList;

    invoke-virtual {p1, p3}, Lcom/radaee/util/OutlineList;->GetItem(I)Lcom/radaee/util/OutlineListAdt$outline_ui_item;

    move-result-object p1

    .line 299
    iget-object p2, p0, Lcom/radaee/util/CommonUtil$1;->val$mPdfLayoutView:Lcom/radaee/view/ILayoutView;

    invoke-virtual {p1}, Lcom/radaee/util/OutlineListAdt$outline_ui_item;->GetPageNO()I

    move-result p1

    invoke-interface {p2, p1}, Lcom/radaee/view/ILayoutView;->PDFGotoPage(I)V

    .line 300
    iget-object p1, p0, Lcom/radaee/util/CommonUtil$1;->val$mAlertDialog:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    return-void
.end method
