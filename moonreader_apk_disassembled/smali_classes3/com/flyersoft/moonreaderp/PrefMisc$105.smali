.class Lcom/flyersoft/moonreaderp/PrefMisc$105;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->backupProc(Landroid/app/Dialog;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$autoCb:Landroid/widget/CheckBox;

.field final synthetic val$con:Landroid/content/Context;

.field final synthetic val$timeRange:[Ljava/lang/String;


# direct methods
.method constructor <init>([Ljava/lang/String;Landroid/content/Context;Landroid/widget/CheckBox;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2852
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$105;->val$timeRange:[Ljava/lang/String;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$105;->val$con:Landroid/content/Context;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$105;->val$autoCb:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 2855
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$105;->val$timeRange:[Ljava/lang/String;

    const/4 v0, 0x0

    aget-object v0, p1, v0

    const/4 v1, 0x1

    aget-object v1, p1, v1

    const/4 v2, 0x2

    aget-object p1, p1, v2

    filled-new-array {v0, v1, p1}, [Ljava/lang/String;

    move-result-object p1

    .line 2856
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$105;->val$con:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->auto_backup:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    sget v1, Lcom/flyersoft/tools/A;->autobackupType:I

    const/4 v2, 0x0

    .line 2857
    invoke-virtual {v0, p1, v1, v2}, Lcom/flyersoft/components/MyDialog;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$105$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefMisc$105$1;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc$105;)V

    const v1, 0x104000a

    .line 2858
    invoke-virtual {p1, v1, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 2865
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method
