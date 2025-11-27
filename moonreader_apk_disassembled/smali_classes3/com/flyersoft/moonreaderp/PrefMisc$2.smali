.class Lcom/flyersoft/moonreaderp/PrefMisc$2;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 209
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$2;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onClick$0$com-flyersoft-moonreaderp-PrefMisc$2(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 216
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$2;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->gdriveSplit:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 217
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$2;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->gdriveLay:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 218
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$2;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc;->root:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->gdriveTip:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 212
    new-instance p1, Lcom/flyersoft/components/MyDialog;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$2;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->tip:I

    .line 213
    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const-string v0, "Please note that Google Drive may restrict our app from accessing Google Drive files for new accounts. If your account has not been connected to Google Drive in our app before, please use Dropbox or WebDav or FTP instead."

    .line 214
    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$2$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$2$$ExternalSyntheticLambda0;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc$2;)V

    const v1, 0x104000a

    .line 215
    invoke-virtual {p1, v1, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    .line 220
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 221
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method
