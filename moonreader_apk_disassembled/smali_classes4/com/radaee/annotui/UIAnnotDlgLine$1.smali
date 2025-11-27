.class Lcom/radaee/annotui/UIAnnotDlgLine$1;
.super Ljava/lang/Object;
.source "UIAnnotDlgLine.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/annotui/UIAnnotDlgLine;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/annotui/UIAnnotDlgLine;


# direct methods
.method constructor <init>(Lcom/radaee/annotui/UIAnnotDlgLine;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 22
    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgLine$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgLine;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 25
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 27
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgLine$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgLine;

    iget-object p1, p1, Lcom/radaee/annotui/UIAnnotDlgLine;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Lcom/radaee/pdf/Page$Annotation;->IsLocked()Z

    move-result p1

    const/4 p2, 0x0

    if-eqz p1, :cond_0

    .line 28
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgLine$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgLine;

    invoke-virtual {p1}, Lcom/radaee/annotui/UIAnnotDlgLine;->getContext()Landroid/content/Context;

    move-result-object p1

    sget v0, Lcom/radaee/viewlib/R$string;->cannot_write_or_encrypted:I

    invoke-static {p1, v0, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 32
    :cond_0
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgLine$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgLine;

    iget-object p1, p1, Lcom/radaee/annotui/UIAnnotDlgLine;->m_layout:Landroid/widget/RelativeLayout;

    sget v0, Lcom/radaee/viewlib/R$id;->edit_lwidth:I

    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    .line 33
    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotDlgLine$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgLine;

    iget-object v0, v0, Lcom/radaee/annotui/UIAnnotDlgLine;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p1

    invoke-virtual {v0, p1}, Lcom/radaee/pdf/Page$Annotation;->SetStrokeWidth(F)Z

    .line 34
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgLine$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgLine;

    iget-object p1, p1, Lcom/radaee/annotui/UIAnnotDlgLine;->m_layout:Landroid/widget/RelativeLayout;

    sget v0, Lcom/radaee/viewlib/R$id;->btn_lstyle:I

    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/radaee/annotui/UILStyleButton;

    .line 35
    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotDlgLine$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgLine;

    iget-object v0, v0, Lcom/radaee/annotui/UIAnnotDlgLine;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Lcom/radaee/annotui/UILStyleButton;->getDash()[F

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/radaee/pdf/Page$Annotation;->SetStrokeDash([F)Z

    .line 37
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgLine$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgLine;

    iget-object p1, p1, Lcom/radaee/annotui/UIAnnotDlgLine;->m_layout:Landroid/widget/RelativeLayout;

    sget v0, Lcom/radaee/viewlib/R$id;->btn_lcolor:I

    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/radaee/annotui/UIColorButton;

    .line 38
    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotDlgLine$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgLine;

    iget-object v0, v0, Lcom/radaee/annotui/UIAnnotDlgLine;->m_layout:Landroid/widget/RelativeLayout;

    sget v1, Lcom/radaee/viewlib/R$id;->seek_alpha:I

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    .line 39
    invoke-virtual {p1}, Lcom/radaee/annotui/UIColorButton;->getColor()I

    move-result p1

    const v1, 0xffffff

    and-int/2addr p1, v1

    .line 40
    invoke-virtual {v0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    .line 42
    :cond_1
    iget-object v2, p0, Lcom/radaee/annotui/UIAnnotDlgLine$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgLine;

    iget-object v2, v2, Lcom/radaee/annotui/UIAnnotDlgLine;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    shl-int/lit8 v0, v0, 0x18

    or-int/2addr p1, v0

    invoke-virtual {v2, p1}, Lcom/radaee/pdf/Page$Annotation;->SetStrokeColor(I)Z

    .line 44
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgLine$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgLine;

    iget-object p1, p1, Lcom/radaee/annotui/UIAnnotDlgLine;->m_layout:Landroid/widget/RelativeLayout;

    sget v2, Lcom/radaee/viewlib/R$id;->btn_fcolor:I

    invoke-virtual {p1, v2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/radaee/annotui/UIColorButton;

    .line 45
    invoke-virtual {p1}, Lcom/radaee/annotui/UIColorButton;->getColorEnable()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 46
    invoke-virtual {p1}, Lcom/radaee/annotui/UIColorButton;->getColor()I

    move-result p1

    and-int/2addr p1, v1

    .line 47
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgLine$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgLine;

    iget-object p2, p2, Lcom/radaee/annotui/UIAnnotDlgLine;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    or-int/2addr p1, v0

    invoke-virtual {p2, p1}, Lcom/radaee/pdf/Page$Annotation;->SetFillColor(I)Z

    goto :goto_0

    .line 49
    :cond_2
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgLine$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgLine;

    iget-object p1, p1, Lcom/radaee/annotui/UIAnnotDlgLine;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1, p2}, Lcom/radaee/pdf/Page$Annotation;->SetFillColor(I)Z

    .line 51
    :goto_0
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgLine$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgLine;

    iget-object p1, p1, Lcom/radaee/annotui/UIAnnotDlgLine;->m_layout:Landroid/widget/RelativeLayout;

    sget p2, Lcom/radaee/viewlib/R$id;->btn_lhead1:I

    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/radaee/annotui/UILHeadButton;

    .line 52
    invoke-virtual {p1}, Lcom/radaee/annotui/UILHeadButton;->getStyle()I

    move-result p1

    .line 53
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgLine$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgLine;

    iget-object p2, p2, Lcom/radaee/annotui/UIAnnotDlgLine;->m_layout:Landroid/widget/RelativeLayout;

    sget v0, Lcom/radaee/viewlib/R$id;->btn_lhead2:I

    invoke-virtual {p2, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/radaee/annotui/UILHeadButton;

    .line 54
    invoke-virtual {p2}, Lcom/radaee/annotui/UILHeadButton;->getStyle()I

    move-result p2

    shl-int/lit8 p2, p2, 0x10

    or-int/2addr p1, p2

    .line 55
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgLine$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgLine;

    iget-object p2, p2, Lcom/radaee/annotui/UIAnnotDlgLine;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p2, p1}, Lcom/radaee/pdf/Page$Annotation;->SetLineStyle(I)Z

    .line 58
    :goto_1
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgLine$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgLine;

    iget-object p1, p1, Lcom/radaee/annotui/UIAnnotDlgLine;->m_layout:Landroid/widget/RelativeLayout;

    sget p2, Lcom/radaee/viewlib/R$id;->chk_lock:I

    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/CheckBox;

    .line 59
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgLine$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgLine;

    iget-object p2, p2, Lcom/radaee/annotui/UIAnnotDlgLine;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    invoke-virtual {p2, p1}, Lcom/radaee/pdf/Page$Annotation;->SetLocked(Z)V

    .line 61
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgLine$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgLine;

    iget-object p1, p1, Lcom/radaee/annotui/UIAnnotDlgLine;->m_callback:Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    if-eqz p1, :cond_3

    .line 62
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgLine$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgLine;

    iget-object p1, p1, Lcom/radaee/annotui/UIAnnotDlgLine;->m_callback:Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    invoke-interface {p1}, Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;->onUpdate()V

    :cond_3
    return-void
.end method
