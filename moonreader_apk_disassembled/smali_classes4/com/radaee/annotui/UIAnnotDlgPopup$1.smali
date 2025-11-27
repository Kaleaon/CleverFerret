.class Lcom/radaee/annotui/UIAnnotDlgPopup$1;
.super Ljava/lang/Object;
.source "UIAnnotDlgPopup.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/annotui/UIAnnotDlgPopup;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/annotui/UIAnnotDlgPopup;


# direct methods
.method constructor <init>(Lcom/radaee/annotui/UIAnnotDlgPopup;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 18
    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgPopup$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgPopup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 21
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgPopup$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgPopup;

    iget-object p2, p2, Lcom/radaee/annotui/UIAnnotDlgPopup;->m_layout:Landroid/widget/RelativeLayout;

    sget v0, Lcom/radaee/viewlib/R$id;->txt_subj:I

    invoke-virtual {p2, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/EditText;

    .line 22
    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotDlgPopup$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgPopup;

    iget-object v0, v0, Lcom/radaee/annotui/UIAnnotDlgPopup;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/radaee/pdf/Page$Annotation;->SetPopupSubject(Ljava/lang/String;)Z

    .line 23
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgPopup$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgPopup;

    iget-object p2, p2, Lcom/radaee/annotui/UIAnnotDlgPopup;->m_layout:Landroid/widget/RelativeLayout;

    sget v0, Lcom/radaee/viewlib/R$id;->txt_content:I

    invoke-virtual {p2, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/EditText;

    .line 24
    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotDlgPopup$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgPopup;

    iget-object v0, v0, Lcom/radaee/annotui/UIAnnotDlgPopup;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/radaee/pdf/Page$Annotation;->SetPopupText(Ljava/lang/String;)Z

    .line 25
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 26
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgPopup$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgPopup;

    iget-object p1, p1, Lcom/radaee/annotui/UIAnnotDlgPopup;->m_callback:Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    if-eqz p1, :cond_0

    .line 27
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgPopup$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgPopup;

    iget-object p1, p1, Lcom/radaee/annotui/UIAnnotDlgPopup;->m_callback:Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    invoke-interface {p1}, Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;->onCancel()V

    :cond_0
    return-void
.end method
