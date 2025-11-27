.class Lcom/radaee/annotui/UIAnnotDlgSign$1;
.super Ljava/lang/Object;
.source "UIAnnotDlgSign.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

.field final synthetic val$ctx:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/radaee/annotui/UIAnnotDlgSign;Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 46
    iput-object p1, p0, Lcom/radaee/annotui/UIAnnotDlgSign$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgSign;

    iput-object p2, p0, Lcom/radaee/annotui/UIAnnotDlgSign$1;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 50
    new-instance p1, Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotDlgSign$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgSign;

    iget-object v0, v0, Lcom/radaee/annotui/UIAnnotDlgSign;->m_layout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 51
    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotDlgSign$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgSign;

    invoke-virtual {v0}, Lcom/radaee/annotui/UIAnnotDlgSign;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$string;->sign_select_certificate:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 52
    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotDlgSign$1;->val$ctx:Landroid/content/Context;

    const-string v1, "layout_inflater"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 53
    sget v1, Lcom/radaee/viewlib/R$layout;->dlg_browser:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 54
    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 55
    iget-object v0, p0, Lcom/radaee/annotui/UIAnnotDlgSign$1;->this$0:Lcom/radaee/annotui/UIAnnotDlgSign;

    invoke-virtual {v0}, Lcom/radaee/annotui/UIAnnotDlgSign;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/radaee/viewlib/R$string;->confirm:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/radaee/annotui/UIAnnotDlgSign$1$1;

    invoke-direct {v1, p0}, Lcom/radaee/annotui/UIAnnotDlgSign$1$1;-><init>(Lcom/radaee/annotui/UIAnnotDlgSign$1;)V

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 61
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    .line 62
    new-instance v0, Lcom/radaee/annotui/UIAnnotDlgSign$1$2;

    invoke-direct {v0, p0}, Lcom/radaee/annotui/UIAnnotDlgSign$1$2;-><init>(Lcom/radaee/annotui/UIAnnotDlgSign$1;)V

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 83
    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    return-void
.end method
