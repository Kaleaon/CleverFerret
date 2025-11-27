.class Lcom/flyersoft/moonreaderp/PrefFontPick$4;
.super Ljava/lang/Object;
.source "PrefFontPick.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefFontPick;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefFontPick;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 154
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefFontPick$4;->this$0:Lcom/flyersoft/moonreaderp/PrefFontPick;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 156
    sput-boolean p2, Lcom/flyersoft/tools/A;->useCssFont:Z

    return-void
.end method
