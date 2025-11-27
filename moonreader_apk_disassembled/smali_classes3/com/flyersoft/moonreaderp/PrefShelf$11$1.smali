.class Lcom/flyersoft/moonreaderp/PrefShelf$11$1;
.super Ljava/lang/Object;
.source "PrefShelf.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShelf$11;->onCheckedChanged(Landroid/widget/CompoundButton;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefShelf$11;

.field final synthetic val$c:Lcom/google/android/material/materialswitch/MaterialSwitch;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelf$11;Lcom/google/android/material/materialswitch/MaterialSwitch;)V
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

    .line 444
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11$1;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$11;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11$1;->val$c:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    const/4 p1, 0x0

    .line 446
    sput-boolean p1, Lcom/flyersoft/tools/A;->needPasswordProtect:Z

    .line 447
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShelf$11$1;->val$c:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {p2, p1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    return-void
.end method
