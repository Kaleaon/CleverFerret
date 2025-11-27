.class Lcom/radaee/annotui/UIAnnotDlgSign$2;
.super Ljava/lang/Object;
.source "UIAnnotDlgSign.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/annotui/UIAnnotDlgSign;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/annotui/UIAnnotDlgSign;

.field final synthetic val$edit_path:Landroid/widget/EditText;

.field final synthetic val$edit_pswd:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/radaee/annotui/UIAnnotDlgSign;Landroid/widget/EditText;Landroid/widget/EditText;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
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

    .line 93
    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgSign$2;->this$0:Lcom/radaee/annotui/UIAnnotDlgSign;

    iput-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgSign$2;->val$edit_path:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/radaee/annotui/UIAnnotDlgSign$2;->val$edit_pswd:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 10

    .line 96
    iget-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgSign$2;->this$0:Lcom/radaee/annotui/UIAnnotDlgSign;

    iget-object p2, p2, Lcom/radaee/annotui/UIAnnotDlgSign;->m_layout:Landroid/widget/RelativeLayout;

    sget v0, Lcom/radaee/viewlib/R$id;->sign_pad:I

    invoke-virtual {p2, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/radaee/annotui/UISignView;

    .line 97
    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotDlgSign$2;->this$0:Lcom/radaee/annotui/UIAnnotDlgSign;

    invoke-static {v0}, Lcom/radaee/annotui/UIAnnotDlgSign;->access$000(Lcom/radaee/annotui/UIAnnotDlgSign;)Lcom/radaee/pdf/Document;

    move-result-object v0

    iget-object v1, p0, Lcom/radaee/annotui/UIAnnotDlgSign$2;->this$0:Lcom/radaee/annotui/UIAnnotDlgSign;

    iget-object v1, v1, Lcom/radaee/annotui/UIAnnotDlgSign;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    invoke-virtual {p2, v0, v1}, Lcom/radaee/annotui/UISignView;->SignMakeForm(Lcom/radaee/pdf/Document;Lcom/radaee/pdf/Page$Annotation;)Lcom/radaee/pdf/Document$DocForm;

    move-result-object v3

    const/4 p2, 0x1

    if-nez v3, :cond_0

    .line 99
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgSign$2;->this$0:Lcom/radaee/annotui/UIAnnotDlgSign;

    invoke-virtual {p1}, Lcom/radaee/annotui/UIAnnotDlgSign;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "Form is empty"

    invoke-static {p1, v0, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 104
    :cond_0
    sget-boolean v0, Lcom/radaee/pdf/Global;->g_fake_sign:Z

    if-nez v0, :cond_1

    .line 105
    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotDlgSign$2;->val$edit_path:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 106
    iget-object v1, p0, Lcom/radaee/annotui/UIAnnotDlgSign$2;->val$edit_pswd:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 110
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/radaee/pdf/Global;->tmp_path:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/radaeepdf_test.pfx"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 111
    const-string v1, "RadaeePDFTest"

    :goto_0
    move-object v4, v0

    move-object v5, v1

    .line 113
    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotDlgSign$2;->this$0:Lcom/radaee/annotui/UIAnnotDlgSign;

    iget-object v2, v0, Lcom/radaee/annotui/UIAnnotDlgSign;->m_annot:Lcom/radaee/pdf/Page$Annotation;

    const-string v8, ""

    const-string v9, ""

    const-string v6, ""

    const-string v7, ""

    invoke-virtual/range {v2 .. v9}, Lcom/radaee/pdf/Page$Annotation;->SignField(Lcom/radaee/pdf/Document$DocForm;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_3

    .line 116
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 117
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgSign$2;->this$0:Lcom/radaee/annotui/UIAnnotDlgSign;

    iget-object p1, p1, Lcom/radaee/annotui/UIAnnotDlgSign;->m_callback:Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    if-eqz p1, :cond_2

    .line 118
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgSign$2;->this$0:Lcom/radaee/annotui/UIAnnotDlgSign;

    iget-object p1, p1, Lcom/radaee/annotui/UIAnnotDlgSign;->m_callback:Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;

    invoke-interface {p1}, Lcom/radaee/annotui/UIAnnotMenu$IMemnuCallback;->onUpdate()V

    :cond_2
    return-void

    :cond_3
    const/4 p1, -0x5

    if-ne v0, p1, :cond_4

    .line 121
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgSign$2;->this$0:Lcom/radaee/annotui/UIAnnotDlgSign;

    invoke-virtual {p1}, Lcom/radaee/annotui/UIAnnotDlgSign;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotDlgSign$2;->this$0:Lcom/radaee/annotui/UIAnnotDlgSign;

    invoke-virtual {v0}, Lcom/radaee/annotui/UIAnnotDlgSign;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$string;->sign_error_fail_certificate:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    .line 123
    :cond_4
    iget-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgSign$2;->this$0:Lcom/radaee/annotui/UIAnnotDlgSign;

    invoke-virtual {p1}, Lcom/radaee/annotui/UIAnnotDlgSign;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotDlgSign$2;->this$0:Lcom/radaee/annotui/UIAnnotDlgSign;

    invoke-virtual {v0}, Lcom/radaee/annotui/UIAnnotDlgSign;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$string;->sign_error_fail:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method
