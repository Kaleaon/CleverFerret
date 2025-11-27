.class Lcom/flyersoft/moonreaderp/PrefMisc$107;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->backupProc(Landroid/app/Dialog;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$bookCb:Landroid/widget/CheckBox;

.field final synthetic val$con:Landroid/content/Context;

.field final synthetic val$coverCb:Landroid/widget/CheckBox;

.field final synthetic val$lay:Landroid/view/View;

.field final synthetic val$progressBar2:Landroid/widget/ProgressBar;

.field final synthetic val$tip:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/widget/ProgressBar;Landroid/view/View;Landroid/widget/CheckBox;Landroid/content/Context;Landroid/widget/TextView;Landroid/widget/CheckBox;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2893
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$107;->val$progressBar2:Landroid/widget/ProgressBar;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$107;->val$lay:Landroid/view/View;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$107;->val$bookCb:Landroid/widget/CheckBox;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefMisc$107;->val$con:Landroid/content/Context;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefMisc$107;->val$tip:Landroid/widget/TextView;

    iput-object p6, p0, Lcom/flyersoft/moonreaderp/PrefMisc$107;->val$coverCb:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2

    const-wide/16 v0, 0x0

    .line 2896
    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$sfputtmpBooksSize(J)V

    const/4 p1, 0x0

    if-eqz p2, :cond_0

    .line 2898
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$107;->val$progressBar2:Landroid/widget/ProgressBar;

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 2899
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$107$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$107$1;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc$107;)V

    .line 2911
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefMisc$107$1;->start()V

    goto :goto_0

    .line 2913
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$107;->val$bookCb:Landroid/widget/CheckBox;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->include_books:I

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setText(I)V

    .line 2914
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$107;->val$tip:Landroid/widget/TextView;

    if-nez p2, :cond_2

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$107;->val$coverCb:Landroid/widget/CheckBox;

    invoke-virtual {p2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p2

    if-eqz p2, :cond_1

    goto :goto_1

    :cond_1
    const/16 p1, 0x8

    :cond_2
    :goto_1
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method
