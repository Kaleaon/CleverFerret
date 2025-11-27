.class Lcom/radaee/annotui/UIAnnotDlgMarkup$1;
.super Ljava/lang/Object;
.source "UIAnnotDlgMarkup.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/annotui/UIAnnotDlgMarkup;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/annotui/UIAnnotDlgMarkup;


# direct methods
.method constructor <init>(Lcom/radaee/annotui/UIAnnotDlgMarkup;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 21
    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgMarkup$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgMarkup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 24
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 26
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgMarkup$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgMarkup;

    iget-object p1, p1, Lcom/radaee/annotui/UIAnnotDlgMarkup;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->IsLocked()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 27
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgMarkup$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgMarkup;

    invoke-virtual {p1}, Lcom/radaee/annotui/UIAnnotDlgMarkup;->getContext()Landroid/content/Context;

    move-result-object p1

    sget p2, Lcom/radaee/viewlib/R$string;->cannot_write_or_encrypted:I

    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 30
    :cond_0
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgMarkup$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgMarkup;

    iget-object p1, p1, Lcom/radaee/annotui/UIAnnotDlgMarkup;->m_layout:Landroid/widget/RelativeLayout;

    sget p2, Lcom/radaee/viewlib/R$id;->btn_lcolor:I

    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/radaee/annotui/UIColorButton;

    .line 31
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgMarkup$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgMarkup;

    iget-object p2, p2, Lcom/radaee/annotui/UIAnnotDlgMarkup;->m_layout:Landroid/widget/RelativeLayout;

    sget v0, Lcom/radaee/viewlib/R$id;->seek_alpha:I

    invoke-virtual {p2, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/SeekBar;

    .line 32
    invoke-virtual {p1}, Lcom/radaee/annotui/UIColorButton;->getColor()I

    move-result p1

    const v0, 0xffffff

    and-int/2addr p1, v0

    .line 33
    invoke-virtual {p2}, Landroid/widget/SeekBar;->getProgress()I

    move-result p2

    if-nez p2, :cond_1

    const/4 p2, 0x1

    .line 35
    :cond_1
    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotDlgMarkup$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgMarkup;

    iget-object v0, v0, Lcom/radaee/annotui/UIAnnotDlgMarkup;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {v0}, Lcom/radaee/pdf/Page$Annotation;->GetType()I

    move-result v0

    const/16 v1, 0x9

    if-ne v0, v1, :cond_2

    .line 36
    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotDlgMarkup$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgMarkup;

    iget-object v0, v0, Lcom/radaee/annotui/UIAnnotDlgMarkup;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    shl-int/lit8 p2, p2, 0x18

    or-int/2addr p1, p2

    invoke-virtual {v0, p1}, Lcom/radaee/pdf/Page$Annotation;->SetFillColor(I)Z

    goto :goto_0

    .line 38
    :cond_2
    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotDlgMarkup$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgMarkup;

    iget-object v0, v0, Lcom/radaee/annotui/UIAnnotDlgMarkup;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    shl-int/lit8 p2, p2, 0x18

    or-int/2addr p1, p2

    invoke-virtual {v0, p1}, Lcom/radaee/pdf/Page$Annotation;->SetStrokeColor(I)Z

    .line 41
    :goto_0
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgMarkup$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgMarkup;

    iget-object p1, p1, Lcom/radaee/annotui/UIAnnotDlgMarkup;->m_layout:Landroid/widget/RelativeLayout;

    sget p2, Lcom/radaee/viewlib/R$id;->chk_lock:I

    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    .line 42
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgMarkup$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgMarkup;

    iget-object p2, p2, Lcom/radaee/annotui/UIAnnotDlgMarkup;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    invoke-virtual {p2, p1}, Lcom/radaee/pdf/Page$Annotation;->SetLocked(Z)V

    .line 44
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgMarkup$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgMarkup;

    iget-object p1, p1, Lcom/radaee/annotui/UIAnnotDlgMarkup;->m_callback:Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    if-eqz p1, :cond_3

    .line 45
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgMarkup$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgMarkup;

    iget-object p1, p1, Lcom/radaee/annotui/UIAnnotDlgMarkup;->m_callback:Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    invoke-interface {p1}, Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;->onUpdate()V

    :cond_3
    return-void
.end method
