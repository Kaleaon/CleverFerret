.class public interface abstract Lcom/vladsch/flexmark/util/builder/Extension;
.super Ljava/lang/Object;
.source "Extension.java"


# static fields
.field public static final EMPTY_LIST:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable<",
            "Lcom/vladsch/flexmark/util/builder/Extension;",
            ">;"
        }
    .end annotation
.end field

.field public static final EMPTY_SET:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/vladsch/flexmark/util/builder/Extension;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 20
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/builder/Extension;->EMPTY_SET:Ljava/util/Set;

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/builder/Extension;->EMPTY_LIST:Ljava/lang/Iterable;

    return-void
.end method
