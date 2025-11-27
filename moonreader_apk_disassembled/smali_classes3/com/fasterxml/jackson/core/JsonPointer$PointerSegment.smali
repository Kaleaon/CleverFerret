.class Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;
.super Ljava/lang/Object;
.source "JsonPointer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/fasterxml/jackson/core/JsonPointer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PointerSegment"
.end annotation


# instance fields
.field public final index:I

.field public final next:Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;

.field public pathOffset:I

.field public prev:Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;

.field public final property:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;Ljava/lang/String;I)V
    .locals 0

    .line 812
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 813
    iput-object p1, p0, Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;->next:Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;

    .line 814
    iput-object p2, p0, Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;->property:Ljava/lang/String;

    .line 815
    iput p3, p0, Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;->index:I

    if-eqz p1, :cond_0

    .line 818
    iput-object p0, p1, Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;->prev:Lcom/fasterxml/jackson/core/JsonPointer$PointerSegment;

    :cond_0
    return-void
.end method
