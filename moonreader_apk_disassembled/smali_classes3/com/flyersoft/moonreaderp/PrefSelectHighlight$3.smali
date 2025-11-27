.class Lcom/flyersoft/moonreaderp/PrefSelectHighlight$3;
.super Ljava/lang/Object;
.source "PrefSelectHighlight.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefSelectHighlight;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefSelectHighlight;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefSelectHighlight;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 143
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefSelectHighlight$3;->this$0:Lcom/flyersoft/moonreaderp/PrefSelectHighlight;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 145
    sput-boolean p2, Lcom/flyersoft/tools/A;->showMagnifier:Z

    return-void
.end method
