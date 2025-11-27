.class Lcom/flyersoft/components/DragSort/SelectBar$1$1$1;
.super Ljava/lang/Object;
.source "SelectBar.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/DragSort/SelectBar$1$1;->onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/components/DragSort/SelectBar$1$1;

.field final synthetic val$et:Landroid/widget/EditText;

.field final synthetic val$parent:Landroid/widget/AdapterView;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/DragSort/SelectBar$1$1;Landroid/widget/AdapterView;Landroid/widget/EditText;)V
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

    .line 247
    iput-object p1, p0, Lcom/flyersoft/components/DragSort/SelectBar$1$1$1;->this$1:Lcom/flyersoft/components/DragSort/SelectBar$1$1;

    iput-object p2, p0, Lcom/flyersoft/components/DragSort/SelectBar$1$1$1;->val$parent:Landroid/widget/AdapterView;

    iput-object p3, p0, Lcom/flyersoft/components/DragSort/SelectBar$1$1$1;->val$et:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 249
    iget-object p1, p0, Lcom/flyersoft/components/DragSort/SelectBar$1$1$1;->val$parent:Landroid/widget/AdapterView;

    iget-object p2, p0, Lcom/flyersoft/components/DragSort/SelectBar$1$1$1;->this$1:Lcom/flyersoft/components/DragSort/SelectBar$1$1;

    iget-object p2, p2, Lcom/flyersoft/components/DragSort/SelectBar$1$1;->this$0:Lcom/flyersoft/components/DragSort/SelectBar$1;

    iget-object p2, p2, Lcom/flyersoft/components/DragSort/SelectBar$1;->val$dict_sp2:Landroid/widget/Spinner;

    if-ne p1, p2, :cond_0

    .line 250
    iget-object p1, p0, Lcom/flyersoft/components/DragSort/SelectBar$1$1$1;->val$et:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/flyersoft/tools/A;->my_dict_url2:Ljava/lang/String;

    return-void

    .line 252
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/components/DragSort/SelectBar$1$1$1;->val$et:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/flyersoft/tools/A;->my_dict_url:Ljava/lang/String;

    return-void
.end method
