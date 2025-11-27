.class Lcom/flyersoft/moonreaderp/PrefShelfFilter$1;
.super Ljava/lang/Object;
.source "PrefShelfFilter.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShelfFilter;->initView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShelfFilter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelfFilter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 103
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter$1;->this$0:Lcom/flyersoft/moonreaderp/PrefShelfFilter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 105
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelfFilter$1;->this$0:Lcom/flyersoft/moonreaderp/PrefShelfFilter;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/PrefShelfFilter;->-$$Nest$mupdateBookType(Lcom/flyersoft/moonreaderp/PrefShelfFilter;Z)V

    return-void
.end method
