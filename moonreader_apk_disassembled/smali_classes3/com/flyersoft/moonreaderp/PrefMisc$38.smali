.class Lcom/flyersoft/moonreaderp/PrefMisc$38;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->setPageSound()V
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

    .line 1208
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$38;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 1212
    new-instance p1, Landroid/widget/LinearLayout;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$38;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/high16 p2, 0x41000000    # 8.0f

    .line 1213
    invoke-static {p2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result p2

    const/high16 v0, 0x41800000    # 16.0f

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v0

    invoke-virtual {p1, p2, v1, v2, v0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 1214
    new-instance p2, Landroid/widget/CheckBox;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$38;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 1215
    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1216
    sget v0, Lcom/flyersoft/moonreaderp/R$string;->reduce_page_volume:I

    invoke-virtual {p2, v0}, Landroid/widget/CheckBox;->setText(I)V

    .line 1217
    sget-boolean v0, Lcom/flyersoft/tools/A;->reducePageSound:Z

    invoke-virtual {p2, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1218
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$38;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->page_sound:I

    .line 1219
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    .line 1220
    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$38$1;

    invoke-direct {v0, p0, p2}, Lcom/flyersoft/moonreaderp/PrefMisc$38$1;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc$38;Landroid/widget/CheckBox;)V

    const p2, 0x104000a

    .line 1221
    invoke-virtual {p1, p2, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 1226
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    .line 1227
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$38;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    const/4 p2, 0x0

    iput-object p2, p1, Lcom/flyersoft/moonreaderp/PrefMisc;->pageSoundDlg:Lcom/flyersoft/components/MyDialog;

    return-void
.end method
