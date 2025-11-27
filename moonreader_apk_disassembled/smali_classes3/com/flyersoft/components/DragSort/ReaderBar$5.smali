.class Lcom/flyersoft/components/DragSort/ReaderBar$5;
.super Ljava/lang/Object;
.source "ReaderBar.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/DragSort/ReaderBar;->customizeBottomIcons(Landroid/content/Context;Z)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$buttons:Ljava/util/ArrayList;

.field final synthetic val$cb:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Landroid/widget/CheckBox;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 234
    iput-object p1, p0, Lcom/flyersoft/components/DragSort/ReaderBar$5;->val$cb:Landroid/widget/CheckBox;

    iput-object p2, p0, Lcom/flyersoft/components/DragSort/ReaderBar$5;->val$buttons:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 236
    iget-object p1, p0, Lcom/flyersoft/components/DragSort/ReaderBar$5;->val$cb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->doubleLineBar:Z

    .line 237
    iget-object p1, p0, Lcom/flyersoft/components/DragSort/ReaderBar$5;->val$buttons:Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/flyersoft/components/DragSort/ReaderBar;->saveButtons(Ljava/util/ArrayList;)V

    .line 238
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 239
    sget-object p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->selfPref:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setBottomIconsVisibility()V

    :cond_0
    return-void
.end method
