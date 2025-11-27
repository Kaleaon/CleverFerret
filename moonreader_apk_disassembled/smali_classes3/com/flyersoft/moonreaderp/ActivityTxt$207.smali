.class Lcom/flyersoft/moonreaderp/ActivityTxt$207;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showPdfRenderEngineOption(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$cb:Landroid/widget/CheckBox;

.field final synthetic val$glGroup:Landroid/widget/RadioGroup;

.field final synthetic val$showNightModeTip:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/widget/RadioGroup;ZLandroid/widget/CheckBox;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 19372
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$207;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$207;->val$glGroup:Landroid/widget/RadioGroup;

    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$207;->val$showNightModeTip:Z

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$207;->val$cb:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 19375
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$207;->val$glGroup:Landroid/widget/RadioGroup;

    invoke-virtual {p1}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result p1

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->glRadio:I

    const/4 v0, 0x0

    if-ne p1, p2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 19376
    :goto_0
    iget-boolean p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$207;->val$showNightModeTip:Z

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$207;->val$cb:Landroid/widget/CheckBox;

    invoke-virtual {p2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p2

    if-eqz p2, :cond_1

    .line 19377
    sput-boolean v0, Lcom/flyersoft/tools/A;->askPdfNightTip:Z

    .line 19378
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$207;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p2}, Lcom/flyersoft/tools/A;->SaveOptions(Landroid/content/Context;)V

    .line 19380
    :cond_1
    sget-boolean p2, Lcom/flyersoft/tools/A;->gl:Z

    if-eq p1, p2, :cond_2

    .line 19381
    sput-boolean p1, Lcom/radaee/pdf/Global;->gl:Z

    sput-boolean p1, Lcom/flyersoft/tools/A;->gl:Z

    .line 19382
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$207;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->SaveOptions(Landroid/content/Context;)V

    .line 19383
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$207;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderIntent()V

    :cond_2
    return-void
.end method
