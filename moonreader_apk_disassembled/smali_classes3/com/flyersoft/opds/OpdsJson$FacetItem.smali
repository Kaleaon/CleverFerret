.class Lcom/flyersoft/opds/OpdsJson$FacetItem;
.super Ljava/lang/Object;
.source "OpdsJson.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/opds/OpdsJson;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "FacetItem"
.end annotation


# instance fields
.field links:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/opds/OpdsJson$Links;",
            ">;"
        }
    .end annotation
.end field

.field metadata:Lcom/flyersoft/opds/OpdsJson$Metadata;

.field final synthetic this$0:Lcom/flyersoft/opds/OpdsJson;


# direct methods
.method constructor <init>(Lcom/flyersoft/opds/OpdsJson;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 73
    iput-object p1, p0, Lcom/flyersoft/opds/OpdsJson$FacetItem;->this$0:Lcom/flyersoft/opds/OpdsJson;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
