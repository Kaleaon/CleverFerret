.class Lcom/flyersoft/moonreaderp/PrefShelf$2$3;
.super Ljava/lang/Object;
.source "PrefShelf.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShelf$2;->onCheckedChanged(Landroid/widget/CompoundButton;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefShelf$2;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelf$2;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 153
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$2$3;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    const/4 p1, 0x1

    .line 156
    sput-boolean p1, Lcom/flyersoft/tools/A;->eink:Z

    sput-boolean p1, Lcom/radaee/pdf/Global;->eink:Z

    .line 157
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefTheme;->doEinkEnable()V

    return-void
.end method
