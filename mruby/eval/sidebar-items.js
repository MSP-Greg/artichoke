initSidebarItems({"struct":[["EvalContext","`EvalContext` is used to manipulate the state of a wrapped [`sys::mrb_state`]. [`Mrb`] maintains a stack of `EvalContext`s and [`MrbEval::eval`] uses the current context to set the `__FILE__` magic constant on the [`sys::mrbc_context`]."]],"trait":[["MrbEval","Interpreters that implement [`MrbEval`] expose methods for injecting code into a [`sys::mrb_state`] and extracting [`Value`]s from the interpereter."]]});